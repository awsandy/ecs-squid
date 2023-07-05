echo "Install OS tools"
sudo yum -y -q -e 0 install nodejs siege jq moreutils nmap >/dev/null
echo "Update OS tools"
sudo yum update -y >/dev/null
echo "Update pip"
sudo pip install --upgrade pip 2 &>/dev/null

#
echo "Uninstall AWS CLI v1"
sudo /usr/local/bin/pip uninstall awscli -y 2 &>/dev/null
sudo pip uninstall awscli -y 2 &>/dev/null
echo "Install AWS CLI v2"
curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" >/dev/null
unzip -qq awscliv2.zip
sudo ./aws/install >/dev/null
echo "alias aws='/usr/local/bin/aws'" >>~/.bash_profile
source ~/.bash_profile
rm -f awscliv2.zip
rm -rf aws

# setup for AWS cli
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
export AZS=($(aws ec2 describe-availability-zones --query 'AvailabilityZones[].ZoneName' --output text --region $AWS_REGION))
export TF_VAR_region=${AWS_REGION}
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo "AWS_REGION is not set !!"
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
echo "export AZS=(${AZS[@]})" | tee -a ~/.bash_profile
echo "export TF_VAR_region=${AWS_REGION}" | tee -a ~/.bash_profile

aws configure set default.region ${AWS_REGION}
aws configure get region

aws sts get-caller-identity --query Arn | grep AWSCloud9SSMAccessRole >/dev/null
if [ $? -eq 0 ]; then
  rm -vf ${HOME}/.aws/credentials
else
  #echo "ERROR: Could not find Instance profile AWSCloud9SSMAccessRole! - DO NOT PROCEED"
  echo "Check Cloud9 AWS Managed temporary credentials are disabled - in AWS Settings"
fi

#echo "Setup Terraform cache"
#if [ ! -f $HOME/.terraform.d/plugin-cache ]; then
#  mkdir -p $HOME/.terraform.d/plugin-cache
#  cp tf-setup/dot-terraform.rc $HOME/.terraformrc
#fi

echo "ssh key"
if [ ! -f ~/.ssh/id_rsa ]; then
  mkdir -p ~/.ssh
  ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
  chmod 600 ~/.ssh/id*
fi
#
echo "ssm cli add on"
curl --silent "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo yum install -y session-manager-plugin.rpm >/dev/null
rm -f ~/environment/session-manager-plugin.rpm
#

# cleanup key_pair if already there
aws ec2 delete-key-pair --key-name "eksworkshop" >/dev/null

echo "pip3"
curl --silent "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python3 get-pip.py 2 &>/dev/null
echo "git-remote-codecommit"
pip3 install git-remote-codecommit 2 &>/dev/null

# ------  resize OS disk -----------
# Specify the desired volume size in GiB as a command-line argument. If not specified, default to 32 GiB.
VOLUME_SIZE=${1:-32}

# Get the ID of the environment host Amazon EC2 instance.
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data//instance-id)

# Get the ID of the Amazon EBS volume associated with the instance.
VOLUME_ID=$(aws ec2 describe-instances \
  --instance-id $INSTANCE_ID \
  --query "Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId" \
  --output text)

# Resize the EBS volume.
aws ec2 modify-volume --volume-id $VOLUME_ID --size $VOLUME_SIZE >/dev/null

# Wait for the resize to finish.
while [ \
  "$(aws ec2 describe-volumes-modifications \
    --volume-id $VOLUME_ID \
    --filters Name=modification-state,Values="optimizing","completed" \
    --query "length(VolumesModifications)" \
    --output text)" != "1" ]; do
  sleep 1
done

if [ $(readlink -f /dev/xvda) = "/dev/xvda" ]; then
  # Rewrite the partition table so that the partition takes up all the space that it can.
  sudo growpart /dev/xvda 1

  # Expand the size of the file system.
  sudo resize2fs /dev/xvda1 >/dev/null

else
  # Rewrite the partition table so that the partition takes up all the space that it can.
  sudo growpart /dev/nvme0n1 1

  # Expand the size of the file system.
  sudo resize2fs /dev/nvme0n1p1 &>/dev/null  #(Amazon Linux 1)
  sudo xfs_growfs /dev/nvme0n1p1 &>/dev/null #(Amazon Linux 2)
fi
df -m /
#
#

echo "Verify ...."
for command in jq aws wget terraform; do
  which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
done

this=$(pwd)
#echo "sample apps"
cd ~/environment

echo "Enable bash_completion"
. /etc/profile.d/bash_completion.sh &>/dev/null
. ~/.bash_completion
echo "alias tfb='terraform init && terraform plan -out tfplan && terraform apply tfplan'" >>~/.bash_profile
echo "alias aws='/usr/local/bin/aws'" >>~/.bash_profile
source ~/.bash_profile
#
echo "export AWS_DEFAULT_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)" >>~/.bashrc
echo "export AWS_REGION=\$AWS_DEFAULT_REGION" >>~/.bashrc
echo "export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)" >>~/.bashrc
source ~/.bashrc
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set

echo "export AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure get default.region

test -n "$AWS_REGION" && echo "PASSED: AWS_REGION is $AWS_REGION" || echo AWS_REGION is not set !!
test -n "$TF_VAR_region" && echo "PASSED: TF_VAR_region is $TF_VAR_region" || echo TF_VAR_region is not set !!
test -n "$ACCOUNT_ID" && echo "PASSED: ACCOUNT_ID is $ACCOUNT_ID" || echo ACCOUNT_ID is not set !!
echo "setup tools run" >>~/setup-tools.log

#profile_name="eksworkshop-admin"
instance_id=$(curl -sS http://169.254.169.254/latest/meta-data/instance-id)
ipa=$(aws ec2 describe-instances --instance-ids $instance_id --query Reservations[].Instances[].IamInstanceProfile | jq -r .[].Arn)
iip=$(aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$instance_id" --query IamInstanceProfileAssociations[].AssociationId | jq -r .[])
#echo "Associate $profile_name"
#if aws ec2 replace-iam-instance-profile-association --iam-instance-profile "Name=$profile_name" --association-id $iip; then
if aws cloud9 update-environment --environment-id $C9_PID --managed-credentials-action DISABLE 2>/dev/null; then
  rm -vf ${HOME}/.aws/credentials
  echo "Disabled temporary credentials successfully."
fi
#else
#  echo "ERROR: Encountered error associating instance profile eksworkshop-admin with Cloud9 environment"
#fi

## CDK

# Install prerequisite packages
sudo yum -y install jq nodejs siege

# Install cdk packages
pip3 install --user --upgrade awslogs

#  Verify environment variables required to communicate with AWS API's via the cli tools
grep AWS_DEFAULT_REGION ~/.bashrc
if [ $? -ne 0 ]; then
  echo "export AWS_DEFAULT_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)" >>~/.bashrc
fi

grep AWS_REGION ~/.bashrc
if [ $? -ne 0 ]; then
  echo "export AWS_REGION=\$AWS_DEFAULT_REGION" >>~/.bashrc
fi

grep AWS_ACCOUNT_ID ~/.bashrc
if [ $? -ne 0 ]; then
  echo "export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)" >>~/.bashrc
fi

source ~/.bashrc
## IAM roles
aws iam get-role --role-name "AWSServiceRoleForElasticLoadBalancing" || aws iam create-service-linked-role --aws-service-name "elasticloadbalancing.amazonaws.com"
aws iam get-role --role-name "AWSServiceRoleForECS" || aws iam create-service-linked-role --aws-service-name "ecs.amazonaws.com"
