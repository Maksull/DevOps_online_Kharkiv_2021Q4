# Final project

Yuhov Maksym. EPAM final project.  
Technology: Terraform, Ansible, Jenkins

## TERRAFORM

### **Terraform root module**  
  
  
Create : **Jenkins master server, Ansible server, launch configuration for web servers, elastic load balancer for web servers, at leaset two web servers in AWS Autoscaling group**.

***The Ansible server*** is used to manage **all** servers, including installation ```java``` and ```jenkins``` on ***Jenkins server***.  
  
  
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
  
  
Create one AWS IAM role: **ansible_role**.

***ansible_role*** is attached to the ```aws_instance.ansible``` to make it possible to use Ansible plugin ```aws_ec2```, which is used for dynamic inventory.

### **Terraform security_group module**
  

Create three aws_security_group: **web_server, ansible, jenkins**.
  
Attachments:
- ***web_server*** is attached to the ```aws_launch_configuration.web_server```  
- ***ansible*** is attached to the ```aws_instance.ansible```  
- ***jenkins*** is attached to the ```aws_instance.jenkins```  
  
## ANSIBLE

  
***Ansible server***, by default, has *11* playbooks: **install_configure_jenkins, install_apache, install_java, install_jenkins, jenkins_get_cli, jenkins_get_initial_password, jenkins_install_plugins, ping, restart_enable_apache, upload_web_page, install_git**.  
  

Playbook ```install_configure_jenkins``` install **Jenkins** and make basic configuration of it.   
To run ***it*** you need first of all run: ```bash install_ansible_plugins.sh```. It will install plugins for ansible.  
After that you will be able to execute ```ansible-playbook -i aws_ec2.yaml install_configure_jenkins.aml```.  

After you run ```install_configure_jenkins``` execute:
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

## JENKINS

  
After the server is up you can get ***admin password*** in ansible server. You need to run ```ansible-playbook -i aws_ec2.yaml jenkins_get_initial_password```.  
After you did log in you need to ***create credentials***. You can find *Jenkins private ssh key* in Ansible server: ```/home/ec2-user/ansible/jenkins_ssh_key```.  
***Do not forget*** to add *Jenkins public ssh key* to your GitHub account. Public key you can find in Ansible server: ```/home/ec2-user/ansible/jenkins_ssh_key.pub```.  
  
After you did all of these **add the name of the new credentials** in ```jenkinsfile```.
  
When you create your ```pipeline``` these items are required:  
- [ ] [GitHub project]
- [ ] [GitHub hook trigger for GITScm polling]