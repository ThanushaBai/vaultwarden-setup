job "vaultwarden" {
  datacenters = ["dc1"]
  type        = "service"

  group "vaultwarden" {
    count = 1

    volume "data" {
      type      = "host"
      source    = "vaultwarden-data"
      read_only = false
    }

    network {
      port "http" {
        static = 8080
        to     = 80
      }
    }

    task "vaultwarden" {
      driver = "docker"

      config {
        image = "vaultwarden/server:latest"
        ports = ["http"]
      }

      volume_mount {
        volume      = "data"
        destination = "/data"
        read_only   = false
      }

      env {
        DATA_FOLDER       = "/data"
        DOMAIN            = "https://extras-san-prayers-unavailable.trycloudflare.com"
        SIGNUPS_ALLOWED   = "true"
        WEBSOCKET_ENABLED = "true"
      }
    }
  }
}
