# salt_test
This repo will install salt and run masterless to install the latest haproxy from source and install nginx and a boilerplate website
for testing.  This has been developed and tested on an AWS RedHat 7.4 AMI that is updated and has git installed.

## Example
  Bring up an AWS instance, for example use the aws CLI and I will use my updated RedHat 7.4 AMI with git installed,
  this will output the instance id:
 
    aws ec2 run-instances --image-id ami-0889fe5adccf7ccee --security-group-ids sg-07931d6b906bdfef2 \
      --count 1 --instance-type t2.micro --key-name cli-key --query 'Reservations[0].Instances[0].InstanceId' \
      --output=text

  You can also get the instance id from:
  
    aws ec2 describe-instances --query 'Reservations[0].Instances[0].InstanceId' --output=text
    
  Use the instance id to get the public DNS name:
  
    aws ec2 describe-instances --instance-id=$(aws ec2 describe-instances --query 'Reservations[0].Instances[0].InstanceId' \
    --output=text) --query 'Reservations[0].Instances[0].NetworkInterfaces[0].Association.PublicDnsName' --output=text
    
    ec2-54-202-75-53.us-west-2.compute.amazonaws.com
    
  You can now SSH to the host:
  
    ssh -i cli-key.pem ec2-user@$(!!)  <<< You can use the name from the above query
    
  Once logged in:
    - sudo bash
    - cd /tmp
    - git clone https://github.com/choukaikun/salt_test
    - cd salt_test
    - ./salt_install.sh
    
  After a few minutes you should be able to hit the public DNS name with a web browser and see the HTML boilerplate site and 
  you should see logging in /var/lib/haproxy.log on the AWS instance.
  
## Cleanup
  Terminate the instance to cleanup:
    aws ec2 terminate-instances --instance-id=$(aws ec2 describe-instances --query 'Reservations[0].Instances[0].InstanceId' \
    --output=text)
