# delete ECR image
# unlock ELB
#delete squid-ecr-ECSCluster
# aws ecs delete-cluster --cluster 
# delete code commit
aws codecommit delete-repository --repository-name squid-proxy
# delete user
userid=$(aws iam list-service-specific-credentials --user-name git-user | jq -r .ServiceSpecificCredentials[0].ServiceSpecificCredentialId)
if [ "$userid" != "null" ]; then
echo "destroying git user credentaisl for $userid"
aws iam delete-service-specific-credential --service-specific-credential-id $userid --user-name git-user
fi
for j in `aws s3 ls | awk '{print $3}' | grep squid`; do 
echo $j
comm=$(printf "aws s3 rm s3://%s --recursive" $j)
aws s3api delete-objects --bucket ${j} --delete "$(aws s3api list-object-versions --bucket ${j} --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
aws s3api delete-objects --bucket ${j} --delete "$(aws s3api list-object-versions --bucket ${j} --query='{Objects: DeleteMarkers[].{Key:Key,VersionId:VersionId}}')"
echo $comm
eval $comm
comm=$(printf "aws s3 rb s3://%s --force" $j)
echo $comm
eval $comm
done
buck=()
for j in `aws s3 ls | awk '{print $3}' | grep squid`; do 
echo $j
comm=$(printf "aws s3 rm s3://%s --recursive" $j)
echo $comm
eval $comm
comm=$(printf "aws s3 rb s3://%s --force" $j)
echo $comm
eval $comm
done




aws cloudformation delete-stack --stack-name squid-ecr