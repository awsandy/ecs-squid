# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_appmesh_virtual_gateway.ecs-mesh__ecsworkshop-vgw:
resource "aws_appmesh_virtual_gateway" "ecs-mesh__ecsworkshop-vgw" {
  mesh_name = aws_appmesh_mesh.ecs-mesh.id
  name      = "ecsworkshop-vgw"
  tags      = {}
  tags_all  = {}

  spec {

    listener {

      port_mapping {
        port     = 3000
        protocol = "http"
      }
    }
  }
}
