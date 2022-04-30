// A variable for extracting the external IP address of the instance

output "es_ip" {
  value = " You can open Kibana at this ip : http://${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}:5601 "
}