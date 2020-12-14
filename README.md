# KPMGassignment


Problem Statement 1>
A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these
resources. Please remember we will not be judged on the outcome but more focusing on the
approach, style and reproducibility.

Solution:

Key points:

● I have imagined the setup on Azure with a three tier architecture.
      ○ Frontend - Web App/ Blob Storage associated with a CDN
      ○ Backend - Server scaleset behind an App Gateway
      ○ Database - Managed Database Instance
● I have shown 3 Environments for the same
      ○ Dev
      ○ QAT
      ○ Prod

● The storage account used is in a RA-GRS: read-access geo-redundant storage

● Utilized a Verizon CDN (SSL offloading) which has its source on a Webapp

● A static website hosting enable blob storage may also be used

● The Azure Front door/ Traffic manager may be used to do the failover.

● The Right Hand Side of the project is our primary region

● The Azure Site Recovery with the recovery services vault is being used for the
  DR and replication
  
● The VNet is designed with 4 subnets:

      ○ VM Subnet (The large one)- consists of Scale Sets
      ○ Database Subnet (Azure Managed Database Instance)
      ○ App Gateway Subnet
      ○ VNG Subnet (Virtual Network Gateway for connectivity)
      
● Accessibility to the on prem resources: 
      
      ○ Point to Site VPN
 
 The IAAC for a three tier architecture is attached in the file called problem statement1.json
 
The template deploys a 3 Tier RHEL OS on Azure.

The Solution includes
      Web tier Servers, 
      Application tier Servers  
      Database Tier Servers 
  
Problem Statement 2>

We need to write code that will query the metadata of an instance within AWS and provide a json formatted output. The choice of language and implementation is up to you.
Bonus Points
The code allows for a particular data key to be retrieved individually
Hints
· Aws Documentation (https://docs.aws.amazon.com/)
· Azure Documentation (https://docs.microsoft.com/en-us/azure/?product=featured)
· Google Documentation (​https://cloud.google.com/docs​)


Solution:

● I have assumed that the EC2 instance is already created.
  OS assumed is Ubuntu

● If the EC2 instance is not created then we can use the attached kpmg.yml file to create a cloud formation stack

● Log into the EC2

One can also get the metadata using the AWS cli

● Install the AWS CLI

● I am trying to get the tag of the current instance

● But the same code can be used for any particular data key to be retrieved individually
  Output:

● I will create a shell script for this metadata.sh

● I will make it executable by using sudo chmod +x metadata.sh and utilize the vi editor to add the below commands

                curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" 
                sudo apt-get install unzip
                unzip awscli-bundle.zip
                sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
                aws configure 
                aws ec2 describe-tags --filters "Name=resource-id,Values=`ec2metadata --instance-id`"
                
                Output:
                
                {
                "Tags": [
                {
                "ResourceType": "instance", "ResourceId": "i-6a7e559d",
                "Value": "Webserver", "Key": "Name"
                }
                ]
                }
● We can also use the curl command from within the Ec2 instance


                  [ec2-user ~]$ ​curl http://169.254.169.254/latest/meta-data/ ami-id
                  ami-launch-index
                  ami-manifest-path
                  block-device-mapping/ events/
                  hostname
                  iam/
                  instance-action instance-id instance-type local-hostname local-ipv4
                  mac
                  metrics/ 
                  network/ 
                  placement/ 
                  profile 
                  public-hostname 
                  public-ipv4 
                  public-keys/ 
                  reservation-id 
                  security-groups 
                  services/
                  
                  
Problem Statement 3>

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
object = {“x”:{“y”:{“z”:”a”}}} 
key = x/y/z
value = a

Solution/Logic:
                      var object = {"a": { "b": { "c": "d" }}}; 
                      
                      key = "a/b/c"
                      
                      keys = key.split('/')
                      
                      for(i=0; i<keys.length; i++)
                      
                      {
                      
                      object = object[keys[i]] 
                      
                      }
                      
                      console.log(object) 
                      
                     Output ---> d
                      
                      
