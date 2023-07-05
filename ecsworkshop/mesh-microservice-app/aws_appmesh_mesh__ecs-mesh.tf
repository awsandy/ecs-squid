# aws_appmesh_mesh.ecs-mesh:
resource "aws_appmesh_mesh" "ecs-mesh" {
  name     = "ecs-mesh"
  tags     = {}
  tags_all = {}

  spec {
  }
}
