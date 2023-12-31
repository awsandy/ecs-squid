
# create a user for codecommit
usercred=$(aws iam create-service-specific-credential --user-name git-user --service-name codecommit.amazonaws.com) 2> /dev/null
GIT_USERNAME=$(echo $usercred | jq -r '.ServiceSpecificCredential.ServiceUserName')
GIT_PASSWORD=$(echo $usercred | jq -r '.ServiceSpecificCredential.ServicePassword')
CREDENTIAL_ID=$(echo $usercred| jq -r '.ServiceSpecificCredential.ServiceSpecificCredentialId')
test -n "$GIT_USERNAME" && echo GIT_USERNAME is "$GIT_USERNAME" || "echo GIT_USERNAME is not set"
#Clone the (empty) repo:
test -n "$AWS_REGION" && (echo "AWS_REGION is $AWS_REGION") || (echo "AWS_REGION is not set !!!")
rm -rf squid-proxy
git clone codecommit::$AWS_REGION://squid-proxy
cd squid-proxy
git branch -m main
git symbolic-ref HEAD refs/heads/main
cp ../../squid-docker/Dockerfile .
cp ../../squid-docker/allowedlist.txt .
cp ../../squid-docker/entrypoint.sh .
cp ../../squid-docker/squid.conf .
git add .
git commit -m "initial commit"
git push origin main



