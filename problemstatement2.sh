curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" 
sudo apt-get install unzip
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
aws configure 
aws ec2 describe-tags --filters "Name=resource-id,Values=`ec2metadata --instance-id`"
 
 
 
 
 
 
     #       Output:
      #      
      #      {
      #      "Tags": [
       #     {
        #    "ResourceType": "instance", "ResourceId": "i-6a7e559d",
         #   "Value": "Webserver", "Key": "Name"
          #  }
           # ]
            #}
