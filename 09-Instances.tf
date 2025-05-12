# RDS Instance in Private Subnet
resource "aws_db_instance" "rds" {
  multi_az                = false
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = "mydb"
  username                = "admin"
  password                = "Password123!"
  publicly_accessible     = false
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.private_subnet_group.name

  tags = {
    Name ="Database_tier"
 }
}

# EC2 INSTANCE IN PUBLIC SUBNET A
resource "aws_instance" "web" {
  ami           ="ami-0b86aaed8ef90e45f" #change to your preferred ami
  instance_type = "t2.medium"
  vpc_security_group_ids = [aws_security_group.Cloudqueror_SG.id]
  subnet_id = aws_subnet.Webserver_subnet.id
  associate_public_ip_address = true
  key_name = "aws_keys"

  tags = {
    Name = "Operational_tier"
  }


connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("${path.module}/aws_keys.pem")
  host        = self.public_ip
}
  
# provisioner "remote-exec" {
  # inline = [
      # "sudo yum update -y",
      # install java
      # "yum install -y unzip",
      # "yum install -y wget",
      # "amazon-linux-extras install java-openjdk21 -y",
      # install tomcat
      # "wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz",
      # "tar xf apache-tomcat-9.0.78.tar.gz",        
      # install sonarqube and unzip into /opt
      # "wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip",
      # "unzip sonarqube-9.9.0.65466.zip -d /opt",
      # "chown -R ec2-user:ec2-user /opt/sonarqube-9.9.0.65466",
      # start tomcat
      # "cd apache-tomcat-9.0.78/bin",
      # "sh startup.sh",
      # start sonarqube
      # "cd /opt/sonarqube-9.9.0.65466/bin/linux-x86-64",
      # "sh sonarqube.sh start",
      # "yum install -y net-tools",
      # "netstat -tuln | grep 9000",
      # "yum install -y nginx",
      # "systemctl start nginx",
      # "systemctl enable nginx",
    # ]
  # }
}