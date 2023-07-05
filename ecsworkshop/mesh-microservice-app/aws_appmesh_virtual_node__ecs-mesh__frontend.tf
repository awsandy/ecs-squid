# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_appmesh_virtual_node.ecs-mesh__frontend:
resource "aws_appmesh_virtual_node" "ecs-mesh__frontend" {
  mesh_name = aws_appmesh_mesh.ecs-mesh.id
  name      = "frontend"
  tags      = {}
  tags_all  = {}

  spec {
    backend {
      virtual_service {
        virtual_service_name = aws_appmesh_virtual_service.ecs-mesh__ecsdemo-crystal_service_local.name
      }
    }
    backend {
      virtual_service {
        virtual_service_name = aws_appmesh_virtual_service.ecs-mesh__ecsdemo-nodejs_service_local.name
      }
    }

    listener {

      port_mapping {
        port     = 3000
        protocol = "http"
      }
    }

    logging {
      access_log {
        file {
          path = "/dev/stdout"
        }
      }
    }

    service_discovery {
      aws_cloud_map {
        attributes     = {}
        namespace_name = "service.local"
        service_name   = "ecsdemo-frontend"
      }
    }
  }
}