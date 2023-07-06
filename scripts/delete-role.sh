
aws iam remove-role-from-instance-profile --instance-profile-name ecsworkshop-admin --role-name ecsworkshop-admin 
aws iam delete-instance-profile --instance-profile-name ecsworkshop-admin
aws iam detach-role-policy --role-name ecsworkshop-admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam delete-role --role-name ecsworkshop-admin     

