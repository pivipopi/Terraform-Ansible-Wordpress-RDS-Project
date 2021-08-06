#!/bin/bash
sudo yum install -y httpd
sudo systemctl --now enable httpd
echo -n "<h1>Hello World</h1>" | sudo tee /var/www/html/index.html
