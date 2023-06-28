date
aws cloudformation deploy --stack-name squid-ecr --template-file cloudformation/centralised_egress_proxy.yml \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
date