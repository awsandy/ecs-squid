# for demo account
aws codecommit create-repository --repository-name squid-proxy
aws iam create-service-linked-role --aws-service-name ecs.amazonaws.com

aws iam create-user --user-name git-user
aws iam attach-user-policy --user-name git-user --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitPowerUser
usercred=$(aws iam create-service-specific-credential --user-name git-user --service-name codecommit.amazonaws.com)
GIT_USERNAME=$(echo $usercred | jq -r '.ServiceSpecificCredential.ServiceUserName')
GIT_PASSWORD=$(echo $usercred | jq -r '.ServiceSpecificCredential.ServicePassword')
CREDENTIAL_ID=$(echo $usercred| jq -r '.ServiceSpecificCredential.ServiceSpecificCredentialId')
test -n "$GIT_USERNAME" && echo GIT_USERNAME is "$GIT_USERNAME" || "echo GIT_USERNAME is not set"
#Clone the (empty) repo:

```bash
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || "echo AWS_REGION is not set"
git clone codecommit::$AWS_REGION://squid-proxy
cd squid-proxy
cp ../../squid-docker/Dockerfile .
cp ../../squid-docker/allowedlist.txt .
cp ../../squid-docker/entrypoint.sh .
cp ../../squid-docker/squid.conf .
git add .
git commit -m "initial commit"
git push



