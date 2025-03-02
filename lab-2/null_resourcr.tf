resource "null_resource" "ls" {
    provisioner "local-exec" {
        command = "ls -la"
    }
 depends_on = [aws_instance.instances[0]]   
}