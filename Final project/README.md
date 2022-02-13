# Final project

Yuhov Maksym. EPAM final project.  
Technology: Terraform, Docker, Jenkins, Ansible, AWS

## TERRAFORM

### **Terraform root module**  
  
  
Modules: ```root, seucrity_group, iam_role, shh_key```.  
root module : **Jenkins master server, Ansible server, launch configuration for web servers, elastic load balancer for web servers, at leaset two web servers in AWS Autoscaling group**.  

- ```Jenkins master server``` - server with Jenkins (can be in container)  
- ```Ansible server``` - server with Ansible and playbooks. This server is used to manage **all** servers.    
- ```Launch configuration for web servers``` - the settings for the instances in **web servers autoscaling group**  
- ```Web servers autoscaling group``` - autoscaling group for web servers  
- ```Elastic load balancer for web servers``` - check the health of instances in **autoscaling group**

securit_group module: securit groups for **jenkins, ansible, web server** instances.

- ```Jenkins security group``` - has opened **22, 8080** ports
- ```Ansible security group``` - has opened **22** port
- ```Web server security group``` - has opened **22, 80, 443** port

iam_role module: **iam police, iam role, instance profile**  

- ```iam policy``` - the policy for the iam role
- ```iam role``` - the role that allow Ansible to pase the aws data  
- ```instance profile``` - a container for an IAM role that is used to pass role information to an Ansible instance  
  
### **Terraform ssh_key module**
  
 
Generate three keys: **ansible_connection, jenkins_connection, web_server_connection**.
  
Attachments:
- ***ansible_connection*** is attached to the ```aws_instance.ansible```  
- ***jenkins_connection*** is attached to the ```aws_instance.jenkins```  
- ***web_server_connection*** is attached to the ```aws_launch_configuration.web_server```  
  
Save in:
- ***ansible.pem*** saves in: ```final-project/ansible/ansible.pem``` 
- ***jenkins.pem*** saves in: ```final-project/ansible/jenkins.pem```  
- ***web_server.pem*** saves in: ```final-project/ansible/web_server.pem.pem```  

### **Terraform iam_role module**
  
```ansible_policy``` contains the policy that allows Ansible server to parse data about EC2 instances, attached to the ```ansible_role```  
```ansible_role``` is attached to the ```ansible_profile```, that is used to pass role information to an Ansible instance    
```ansible_profile``` is attached to the ```ansible``` server, to make it possible to use Ansible plugin ```aws_ec2```, which is used for dynamic inventory.  

### **Terraform security_group module**
  

Create three aws_security_groups: **web_server, ansible, jenkins**.
  
Attachments:
- ***web_server*** is attached to the ```aws_launch_configuration.web_server```  
- ***ansible*** is attached to the ```aws_instance.ansible```  
- ***jenkins*** is attached to the ```aws_instance.jenkins```  
  
## ANSIBLE

  
***Ansible server***, by default, has *17* playbooks: **install_docker, docker_install_apache, install_apache, docker_install_configure_jenkins, install_configure_jenkins, install_git, install_java, docker_install_jenkins, install_jenkins, jenkins_get_cli, docker_jenkins_get_initial_password, jenkins_get_initial_password, docker_jenkins_install_plugins, jenkins_install_plugins, ping, restart_enable_apache, upload_web_page**.  
  

Playbook ```install_configure_jenkins(docker_install_configure_jenkins)``` install **Jenkins** and make basic configuration of it.   
To run ***it*** you need first of all run: ```bash install_ansible_plugins.sh```. It will install plugins for ansible.  
After that you will be able to execute ```ansible-playbook -i aws_ec2.yaml install_configure_jenkins.aml```.  

After you run ```install_configure_jenkins(docker_install_configure_jenkins)``` the next roles will be executed:
1.  ```install_java``` - install **java** on *Jenkins master and jenkin's nodes*;
2.  ```install_git``` - install **git** on *Jenkins master* to work with GitHub;
3.  ```install_jenkins``` - install **Jenkins** on *Jenkins master server*;
4.  ```jenkins_get_ssh_key``` - create ssh key on **Jenkins master** to connect it with GitHub;
5.  ```jenkins_get_cli``` - get **Jenkins cli** (on ansible server and on jenkins master);
6.  ```jenkins_install_plugins``` - install some plugins on **Jenkins master** (the list below);

<details><summary>Installed plugins</summary>
  
- Locale
- Git
- Pipeline
  
</details>

## DOCKER
  
  
After you run ```ansible-playbook -i aws_ec2.yaml install_docker``` on **Ansible** server the *Jenkins server and Web servers* will have ```Docker engine``` installed.  
After you run ```ansible-playbook -i aws_ec2.yaml docker_install_apache``` on **Ansible** server the *Web servers* will have running ```Apache container```.  
After you run ```ansible-playbook -i aws_ec2.yaml docker_install_jenkins``` on **Ansible** server the "Jenkins server" will have running ```Jenkins container```.  
  
## JENKINS

  
After the server is up you can get ***admin password*** in ansible server. You need to run ```ansible-playbook -i aws_ec2.yaml jenkins_get_initial_password```.  
After you did log in you need to ***create credentials***. You can find *Jenkins private ssh key* in Ansible server: ```/home/ec2-user/ansible/jenkins_ssh_key```.  
***Do not forget*** to add *Jenkins public ssh key* to your GitHub account. Public key you can find in Ansible server: ```/home/ec2-user/ansible/jenkins_ssh_key.pub```.  
  
After you did all of these **add the name of the new credentials** in ```jenkinsfile```.
  
When you create your ```pipeline``` these items are required:  
- [ ] [GitHub project]
- [ ] [GitHub hook trigger for GITScm polling]
