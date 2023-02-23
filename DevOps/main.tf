terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "weatherapi" {
  name         = "dirmans/weatherapi:1.0.0"
  keep_locally = false
  build {
    context = ".."
  }
}

resource "docker_container" "weatherapi" {
  image = docker_image.weatherapi.name
  name  = "weatherapi"
  ports {
    internal = 9000
    external = 9000
  }
}
