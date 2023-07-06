profile_name="ecsworkshop-admin"
aws iam create-role --role-name $profile_name --assume-role-policy-document file://trust-policy.json 
aws iam attach-role-policy --role-name $profile_name --policy-arn arn:aws:iam::aws:policy/AdministratorAccess 
aws iam create-instance-profile --instance-profile-name $profile_name 
aws iam add-role-to-instance-profile --instance-profile-name $profile_name --role-name $profile_name