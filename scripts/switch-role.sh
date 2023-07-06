profile_name="ecsworkshop-admin"

instance_id=$(curl -sS http://169.254.169.254/latest/meta-data/instance-id)
ipa=$(aws ec2 describe-instances --instance-ids $instance_id --query Reservations[].Instances[].IamInstanceProfile | jq -r .[].Arn)
iip=$(aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$instance_id" --query IamInstanceProfileAssociations[].AssociationId | jq -r .[])
echo "Associate $profile_name"
if aws ec2 replace-iam-instance-profile-association --iam-instance-profile "Name=$profile_name" --association-id $iip; then
  if aws cloud9 update-environment --environment-id $C9_PID --managed-credentials-action DISABLE 2> /dev/null; then
    rm -vf ${HOME}/.aws/credentials
    echo "Profile ecsworkshop-admin associated successfully."
  fi
else
  echo "ERROR: Encountered error associating instance profile ecsworkshop-admin with Cloud9 environment"
fi
#
echo "For final checks - run ./check"
#