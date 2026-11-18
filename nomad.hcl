client {
  enabled = true
  host_volume "vaultwarden-data" {
    path      = "/home/thanushabai/vaultwarden-data"
    read_only = false
  }
}
