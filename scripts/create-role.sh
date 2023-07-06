aws cloud9 update-environment --environment-id $C9_PID --managed-credentials-action DISABLE
profile_name="ecsworkshop-admin"
echo "create role $profile_name"
aws iam create-role --role-name $profile_name --assume-role-policy-document file://trust-policy.json 
echo "attach policy to role"
aws iam attach-role-policy --role-name $profile_name --policy-arn arn:aws:iam::aws:policy/AdministratorAccess 
echo "create instance profile"
aws iam create-instance-profile --instance-profile-name $profile_name 
echo "add role to insyance profile"
aws iam add-role-to-instance-profile --instance-profile-name $profile_name --role-name $profile_name