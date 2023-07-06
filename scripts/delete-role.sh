
aws iam remove-role-from-instance-profile --instance-profile-name ecsworkshop-admin --role-name ecsworkshop-admin 
aws iam delete-instance-profile --instance-profile-name ecsworkshop-admin
aws iam detach-role-policy --role-name ecsworkshop-admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam delete-role --role-name ecsworkshop-admin     


aws iam create-role --role-name $profile_name --assume-role-policy-document file://trust-policy.json 
aws iam attach-role-policy --role-name $profile_name --policy-arn arn:aws:iam::aws:policy/AdministratorAccess 
aws iam create-instance-profile --instance-profile-name $profile_name 
aws iam add-role-to-instance-profile --instance-profile-name $profile_name --role-name $profile_name

