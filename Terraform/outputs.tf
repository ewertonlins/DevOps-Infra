output "instance_details" {
  value = {
    for idx, instance in aws_instance.web :
    instance.tags.Name => instance.public_ip
  }
}
