**Software Required for Windows 10**
1. Visual studio code https://code.visualstudio.com/download
2. AWS CLI to setup aws configure https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html
3. Git bash https://gitforwindows.org/
4. Mobaxterm or any putty tool to ssh to web server

**SETUP**
1. Configure AWS access keys by using aws cli command **_aws configure_**

![image](https://user-images.githubusercontent.com/19540015/132687778-cde6158b-5efb-4799-a867-3263ef70a2c5.png)


2. Install teraform plugin in visual studio code

![image](https://user-images.githubusercontent.com/19540015/132688307-0aa95341-f20e-4289-843f-66d1b4cb0111.png)

3. Replace the keyname with your keyname in terraform.tfvars file https://github.com/sam422/terraform-aws/blob/main/exercises/exercise1/terraform.tfvars
4. Change region in main.tf and availability zones in terraform.tfvars as per your choice
5. You can also choose your own cidr block for vpc and subnets

6. If having issues var.workstation_ip, declare the workstation ip in variables.tf

![image](https://user-images.githubusercontent.com/19540015/132692111-accdf3a1-de8c-4334-b5cc-ba0642ab81e6.png)

