resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  tags         = ["http-server", "https-server", "elasticsearch"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.size
    }
  }

  network_interface {
    network = data.google_compute_network.vpc_network.self_link
    # no external IP
    # access_config {
    # }
  }
  service_account {
    scopes = ["cloud-platform"]
  }

  # using metadata script to install elasticsearch & kibana
  metadata_startup_script = <<SCRIPT

    sudo su
    apt-get install wget -y
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
    apt-get install apt-transport-https
    echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
    echo "Installing ElasticSearch..."
    apt-get update && apt-get install elasticsearch
    systemctl start elasticsearch
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

    echo "Installing Kibana..."
    apt-get update && apt-get install kibana
    # This sed will allow kibana to be accessible remotely 
    sed -i "/server.host/s/^#//g" /etc/kibana/kibana.yml
    sed -i 's/localhost/0.0.0.0/' /etc/kibana/kibana.yml
    systemctl start kibana

    SCRIPT
}
