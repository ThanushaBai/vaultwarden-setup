job "vaultwarden" {
  datacenters = ["dc1"]
  type        = "service"

  group "vaultwarden" {
    count = 1

    task "vaultwarden" {
      driver = "raw_exec"

      config {
        command = "/home/thanushabai/vaultwarden"
      }

      env {
        DATA_FOLDER       = "/home/thanushabai/vaultwarden-data"
        DOMAIN            = "https://thanusha-vaultwarden.duckdns.org"
        ROCKET_PORT       = "8080"
        SIGNUPS_ALLOWED   = "true"
        WEBSOCKET_ENABLED = "true"
      }
    }
  }
}
