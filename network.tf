# use resource block to create new vpc network

# resource "google_compute_network" "vpc_network" {
#   name = var.vpc_name
# }

# using data block, as vpc network is already created

data "google_compute_network" "vpc_network" {
  name = var.vpc_name
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = data.google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["9200", "5601", "22"]
  }

  source_tags   = ["elasticsearch"]
  source_ranges = ["0.0.0.0/0"]
}
