# Selenium-Test-on-AWS-Using-Docker

This Project demonstrated how to setup a Selenium Grid on AWS EC2 Instance Using Docker Configurations 

---

So Before we get started we will be required to setup our AWS access key and secret key on terraform. I havent shared my keys but you can replace them in the providers.tf file 

Building the Infrastructure
--

To build the infrastructure we will be creating a EC2 Instance and providing our data thru a script. 

```
terraform init
terraform plan
terraform apply
```

Once we build the Infrastructure we can connect to the instance 
```
ssh -i "YOUR PUBLIC KEY" ec2-user@<YOUR_IP>
```

Configuration Setup and Selenium Hub Start
--

Once we connect to our EC2 Instance we will require to run the following commands to install the dependencies

```
#Become Root user
sudo su
#Install Git
yum install git
#Clone the Project
git clone https://github.com/koushikpr/Selenium-Test-on-AWS-Using-Docker
cd Selenium-Test-on-AWS-Using-Docker
#Run the Bash Script
chmod u+x startup.sh
./startup.sh
```
Edit your Script.py and replace line 17 with 
```
driver = webdriver.Remote(options=chrome_options,command_executor="http://localhost:4444/wd/hub")
```

Docker Compose building 
--

Once you have configured your IP in the script its time for us to build the Selenium Nodes. MongoDB automatically links to the app using Docker Compose
```
docker-compose up 
```

Verify Files
--

To Verify the Test Concurrency You can view the dashboard 
```
https://<YOUR AWS PUBLICIP>:4444/#ui
```

