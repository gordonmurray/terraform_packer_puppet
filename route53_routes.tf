resource "aws_route53_record" "puppet_master_cname" {
  zone_id = var.hosted_zone_id
  name    = "puppet-master.${var.domain_name}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_instance.puppet_master.public_dns]
}

resource "aws_route53_record" "puppet_node_linux_cname" {
  zone_id = var.hosted_zone_id
  name    = "puppet-node-linux.${var.domain_name}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_instance.puppet_linux_node.public_dns]
}

resource "aws_route53_record" "puppet_node_windows_cname" {
  zone_id = var.hosted_zone_id
  name    = "puppet-node-windows.${var.domain_name}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_instance.puppet_windows_node.public_dns]
}