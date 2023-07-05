#!/bin/bash
echo 'Stack ecsworkshop-base Importing 0 of 53 ..'
../../scripts/100-get-vpc.sh vpc-057a64aaa8d96235b
echo 'Stack ecsworkshop-base Importing 1 of 53 ..'
../../scripts/120-get-igw.sh igw-0259dc3652d1731a8
echo 'Stack ecsworkshop-base Importing 2 of 53 ..'
echo '#  AWS::EC2::Route ecswo-BaseV-LYSEC8KX1BS5  fetched as part of RouteTable..'
echo 'Stack ecsworkshop-base Importing 3 of 53 ..'
../../scripts/140-get-route-table.sh rtb-07a8574f5a56a964b
echo 'Stack ecsworkshop-base Importing 4 of 53 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0f434f60d94db19fc
echo 'Stack ecsworkshop-base Importing 5 of 53 ..'
../../scripts/105-get-subnet.sh subnet-0bccbdd46fe42086d
echo 'Stack ecsworkshop-base Importing 6 of 53 ..'
echo '#  AWS::EC2::Route ecswo-BaseV-1VPY71I71MC1N  fetched as part of RouteTable..'
echo 'Stack ecsworkshop-base Importing 7 of 53 ..'
../../scripts/140-get-route-table.sh rtb-0a4eb717ce0ad177a
echo 'Stack ecsworkshop-base Importing 8 of 53 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-086e654b83ec5b3c3
echo 'Stack ecsworkshop-base Importing 9 of 53 ..'
../../scripts/105-get-subnet.sh subnet-0b7ccfbce3d25d6ad
echo 'Stack ecsworkshop-base Importing 10 of 53 ..'
echo '#  AWS::EC2::Route ecswo-BaseV-1WAWLTWUDPL8O  fetched as part of RouteTable..'
echo 'Stack ecsworkshop-base Importing 11 of 53 ..'
../../scripts/140-get-route-table.sh rtb-0d8f7e3bfefba66ec
echo 'Stack ecsworkshop-base Importing 12 of 53 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-038efba10ddfe850b
echo 'Stack ecsworkshop-base Importing 13 of 53 ..'
../../scripts/105-get-subnet.sh subnet-0a5216ba6c4a20153
echo 'Stack ecsworkshop-base Importing 14 of 53 ..'
echo '#  AWS::EC2::Route ecswo-BaseV-19ICEUI04GKXO  fetched as part of RouteTable..'
echo 'Stack ecsworkshop-base Importing 15 of 53 ..'
../../scripts/get-eip.sh 13.41.219.61
echo 'Stack ecsworkshop-base Importing 16 of 53 ..'
../../scripts/130-get-natgw.sh nat-0be8fc24ddb85402d
echo 'Stack ecsworkshop-base Importing 17 of 53 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-06c51ed1bdf2b5d0b
echo 'Stack ecsworkshop-base Importing 18 of 53 ..'
../../scripts/140-get-route-table.sh rtb-0b709fe435360cdfb
echo 'Stack ecsworkshop-base Importing 19 of 53 ..'
../../scripts/105-get-subnet.sh subnet-0a449930323b84bbf
echo 'Stack ecsworkshop-base Importing 20 of 53 ..'
echo '#  AWS::EC2::Route ecswo-BaseV-BECCSH07Q64L  fetched as part of RouteTable..'
echo 'Stack ecsworkshop-base Importing 21 of 53 ..'
../../scripts/get-eip.sh 18.130.2.156
echo 'Stack ecsworkshop-base Importing 22 of 53 ..'
../../scripts/130-get-natgw.sh nat-0a13614648f0e5df4
echo 'Stack ecsworkshop-base Importing 23 of 53 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0ac2dc785830afd6b
echo 'Stack ecsworkshop-base Importing 24 of 53 ..'
../../scripts/140-get-route-table.sh rtb-0351413b64f81ca90
echo 'Stack ecsworkshop-base Importing 25 of 53 ..'
../../scripts/105-get-subnet.sh subnet-090ea4dad86354a04
echo 'Stack ecsworkshop-base Importing 26 of 53 ..'
echo '#  AWS::EC2::Route ecswo-BaseV-CFA8I2B9PF5S  fetched as part of RouteTable..'
echo 'Stack ecsworkshop-base Importing 27 of 53 ..'
../../scripts/get-eip.sh 3.10.32.64
echo 'Stack ecsworkshop-base Importing 28 of 53 ..'
../../scripts/130-get-natgw.sh nat-0c0ea9aebd6258d7e
echo 'Stack ecsworkshop-base Importing 29 of 53 ..'
../../scripts/140-get-route-table.sh rtb-040b26abbf7d9d50f
echo 'Stack ecsworkshop-base Importing 30 of 53 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0ac2f433e55609a34
echo 'Stack ecsworkshop-base Importing 31 of 53 ..'
../../scripts/105-get-subnet.sh subnet-00a09562a158644f8
echo 'Stack ecsworkshop-base Importing 32 of 53 ..'
echo '#  AWS::EC2::VPCGatewayAttachment ecswo-BaseV-AHBKMB8M47S attached as part of IGW etc ..'
echo 'Stack ecsworkshop-base Importing 33 of 53 ..'
echo '# AWS::CDK::Metadata 370d3360-1b36-11ee-ab9c-064b471303dc skipped only relevant to CDK ..' 
echo 'Stack ecsworkshop-base Importing 34 of 53 ..'
../../scripts/350-get-ecs-cluster.sh container-demo
echo 'Stack ecsworkshop-base Importing 35 of 53 ..'
echo '# AWS::ServiceDiscovery::PrivateDnsNamespace ns-edlae6eydoee5gbk fetched as part srv discovery ? ..' 
echo 'Stack ecsworkshop-base Importing 36 of 53 ..'
../../scripts/360-get-appmesh-mesh.sh ecs-mesh
echo 'Stack ecsworkshop-base Importing 37 of 53 ..'
../../scripts/110-get-security-group.sh sg-0f7e3ec5d7c01ab3b
echo 'Stack ecsworkshop-base Importing 38 of 53 ..'
echo '# AWS::EC2::SecurityGroupIngress InboundSecGrp3000 fetched as part of SecurityGroup..'
echo 'Stack ecsworkshop-base Importing 39 of 53 ..'
../../scripts/251-get-ec2-instances.sh i-026e347bca6a4f00f
echo 'Stack ecsworkshop-base Importing 40 of 53 ..'
../../scripts/056-get-iam-instance-profile.sh ecsworkshop-base-InstanceInstanceProfileAB5AEF02-0C7zyILrZhf5
echo 'Stack ecsworkshop-base Importing 41 of 53 ..'
../../scripts/050-get-iam-roles.sh ecsworkshop-base-InstanceSSMCBFA3CF0-N0K8YHX2VEUM
echo 'Stack ecsworkshop-base Importing 42 of 53 ..'
../../scripts/get-ecs-service.sh arn:aws:ecs:eu-west-2:566972129213:service/container-demo/mesh-gw-proxy
echo 'Stack ecsworkshop-base Importing 43 of 53 ..'
../../scripts/get-sd-service.sh srv-y7eei2jrbpto3ryy
echo 'Stack ecsworkshop-base Importing 44 of 53 ..'
../../scripts/elbv2.sh arn:aws:elasticloadbalancing:eu-west-2:566972129213:loadbalancer/net/ecswo-MeshG-FLLW6SVH5ZXC/931d0198707acc37
echo 'Stack ecsworkshop-base Importing 45 of 53 ..'
../../scripts/elbv2_listener.sh arn:aws:elasticloadbalancing:eu-west-2:566972129213:listener/net/ecswo-MeshG-FLLW6SVH5ZXC/931d0198707acc37/9db189ec3902ca54
echo 'Stack ecsworkshop-base Importing 46 of 53 ..'
../../scripts/elbv2-target-groups.sh arn:aws:elasticloadbalancing:eu-west-2:566972129213:targetgroup/ecswor-MeshG-MJA2UCVRN7TB/b9c93bfa2c16729f
echo 'Stack ecsworkshop-base Importing 47 of 53 ..'
../../scripts/110-get-security-group.sh sg-0838ad2e105c5c736
echo 'Stack ecsworkshop-base Importing 48 of 53 ..'
echo '# AWS::AppMesh::VirtualGateway ecs-mesh fetched as part of parent mesh ' 
echo 'Stack ecsworkshop-base Importing 49 of 53 ..'
../../scripts/070-get-cw-log-grp.sh /ecsworkshop-mesh-gateway
echo 'Stack ecsworkshop-base Importing 50 of 53 ..'
../../scripts/get-ecs-task.sh mesh-gw-proxy-taskdef:4
echo 'Stack ecsworkshop-base Importing 51 of 53 ..'
../../scripts/050-get-iam-roles.sh ecsworkshop-base-meshgwproxytaskdefExecutionRoleC1-6EFVJAQ6X4TG
echo 'Stack ecsworkshop-base Importing 52 of 53 ..'
# AWS::IAM::Policy ecswo-mesh-1B858JE7R5AL3 Should be fetched via Roles etc
echo 'Stack ecsworkshop-base Importing 53 of 53 ..'
../../scripts/050-get-iam-roles.sh ecsworkshop-base-meshgwproxytaskdefTaskRoleBD296B1-NJZEXY41X498
echo "Commands Done .."
