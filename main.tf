terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.digitalocean_token
}


# App Platform Function Resource
resource "digitalocean_app" "api" {
  spec {
    name   = "api"
    region = "nyc"

    function {
      name = "events"
      git {
        repo_clone_url = "https://github.com/dsrowell/dynamodbfun.git"
        branch         = "master"
      }
    }
    function {
      name = "registrations"
      git {
        repo_clone_url = "https://github.com/dsrowell/dynamodbfun.git"
        branch         = "master"
      }
    }
    ingress {
      rule {
        component {
          name = "events"
        }
        match {
          path {
            prefix = "/api/events"
          }
        }
      }
      rule {
        component {
          name = "registrations"
        }
        match {
          path {
            prefix = "/api/registrations"
          }
        }
      }
    }
  }
}