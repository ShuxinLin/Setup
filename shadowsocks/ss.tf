provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region     = "${var.region}"
}
resource "aws_instance" "ins" {
  ami = "${lookup(var.amis, var.region)}"
	instance_type = "t2.micro"
	key_name = "local"
  security_groups = [
        "${var.security_group}"
  ]
	provisioner "local-exec" {
    command = "echo ${aws_instance.ins.public_ip} > ip_address.txt"
  }
  connection {
    user = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }        
  provisioner "remote-exec" {
    inline = [
      "curl https://raw.githubusercontent.com/ShuxinLin/Setup/master/shadowsocks/install.sh -o /home/ubuntu/install_agent.sh",
      "bash /home/ubuntu/install_agent.sh"
    ]
  }

}

output "ip" {
  value = "${aws_instance.ins.public_ip}"
}
