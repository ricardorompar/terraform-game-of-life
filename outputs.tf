output "server_url" {
  description = "URL of the web server"
  value       = "http://${aws_instance.web.public_ip}"
}
