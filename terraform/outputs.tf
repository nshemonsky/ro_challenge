output "web_server_ip" {
  description = "Public IP address of web server"
  value       = ["${aws_instance.web_server.public_ip}"]
}
