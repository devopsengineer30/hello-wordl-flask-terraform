 1. Flask Hello World App:
       
Pre-requisites: AWS account with default VPC, AWS Key pair, AWS security credentials.

        i. All the work is done using terraform. We can execute terraform apply and can query the public IP of the instance on any browser to check the message Hello World.
        ii. Deployed Flask Hello world app in AWS EC2 instance
        iii. Using docker-compose, the service is made available to public
        iv. The hello-world-flask image is created and pushed to the AWC ECR 
        v. As per the requirements, the app will restart always, logs the output into var/log/app.log and runs in UTC Timezone

	Note: 
    a) Due to limited time, I couldn’t implement HTTPS functionality
    b) Replace the IPv4 address in ec2_sg security group.
    c) In the install_essentials.sh, replace the ECR registry ID.
    d) Replace the key and aws-profile variables.
    e) Remove the backend step to save the tf state in local.

    2. Hello world lambda function:
        i. Using terraform, deployed hello world python program as lambda fucntion.
        ii. The function will log to cloudwatch.

    3. Modify code to provision an SNS topic:
        i. modified the terraform code created for lambda function in step 2 to create an SNS topic of name ‘blockchain-topic’
