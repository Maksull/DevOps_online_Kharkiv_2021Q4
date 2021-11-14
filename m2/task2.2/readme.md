Launch a Linux Virtual Machine with Amazon ***Lightsail***:  
![Laucnh CentOS](screenshots/centos_lightsail.png)  
Create first instance via ***EC2***:  
![First instance](screenshots/first_instance.png)  
Create a ***snapshot*** of this instance:  
![Create instance](screenshots/instance_backup.png)  
Create new ***volume***:  
![Create new volume](screenshots/Create_new_disk.png)  
*Attach volume* to the instance:  
![Attach volume to the instance](screenshots/attach_disk.png)  
Create file on the disk:  
![Create file on the disk](screenshots/create_file_disk.png)  
Create ***image*** from ***snapshot***:  
![Create image](screenshots/create_image.png)  
Create **instance** from ***AMI***:  
![Create instance from AMI](screenshots/create_instance_from_AMI.png)  
**Instance** from **snapshot**:  
![Instance from snapshot](screenshots/instance_from_snapshot.png)  
***Detach*** from the first instance:  
![Instance from snapshot](screenshots/detach_disk.png)  
***Attach*** the disk to the seccond instance:  
![Instance from snapshot](screenshots/attach_disk_to_instance2.png)  
Launch and configure a *WordPress* instance via **Amazon Lightsail**:  
![wordpress_lightsail](screenshots/wordpress_lightsail.png)  
![Site](screenshots/wordpress_lightsail2.png)  
Create a ***bucket***:  
![Create bucket](screenshots/create_bucket.png)  
Create a ***user***:  
![Create user](screenshots/users.png)  
AWS CLI ***config and upload***:  
![AWS CLI configure and upload](screenshots/aws_configure_upload.png)  
  
  
------------
# DOCKER
  
  
  
In order to install Docker on Linux you need:  
```
sudo apt update
sudo apt install docker-ce
```
Check Docker status:  
```
sudo systemctl status docker
```
![Docker status](screenshots/docker_status.png)  
Check Docker info:  
```
docker info [OPTIONS]
```
![Docker info](screenshots/docker_info.png)  
Check list of ***Docker images*** on the device:
```
docker images [OPTIONS] [REPOSITORY[:TAG]]
```
![Docker images](screenshots/docker_images.png)  
In order to download image from ***Docker hub*** you need:  
```
docker pull tomcat
```
![Docker pull](screenshots/docker_pull.png)  
In order to **run Docker image** you need *docker run [OPTION] [IMAGE]*:  
*-t* : Allocate a pseudo-tty;  
*-i* : Keep STDIN open even if not attached;  
*-p* : Publish all exposed ports to the host interfaces  
```
docker run -it -p 1234:8080 tomcat
```
![Docker run](screenshots/docker_run.png)  
Create my own ***Dockerfile***:  
![Dockerfile](screenshots/dockerfile.png)  
In order to create **image** from **Dockerfile** you need (-t name and optionally a tag in the 'name:tag' format):  
```
docker build -t maksym:v1 .
```
![Docker build](screenshots/docker_build.png)  
To display ***Docker process*** you need (-a option will show all the containers both stopped and running):  
```
docker ps -a
```
![Docker ps](screenshots/docker_ps.png)  
If you want to *remove* the **Docker container**, you need to use:
```
docker rm [OPTIONS] [CONTAINER]
```
![Docker rm](screenshots/docker_rm.png)  
If you want to *remove* the **Docker image** from the device, you need to use: 
```
docker rmi [OPTIONS] [IMAGE]
```
![Docker rmi](screenshots/docker_rmi.png)  
  
  
------------
# Amazon ECS
  
  
  
Create ***repository***:
![Create repository](screenshots/create_repository.png)  
AWS login:  
![AWS login](screenshots/aws_login.png)  
Rename a docker *image* to make it possible to *push* to the **ECS repository**:  
```
docker tag [old_name] [aws_account_id.dkr.ecr.region.amazonaws.com/repository_name:version]
docker push aws_account_id.dkr.ecr.region.amazonaws.com/repository_name:version
```
![Docker tag and Docker push](screenshots/aws_login.png)  
**Repository state** after several *pushes*:  
![Repository state](screenshots/repository.png)  
Create ***lifecycle*** in order to delete old images:  
![Create_lifecycle](screenshots/create_lifecycle.png)  
Pull **Docker image** from repository:  
```
docker pull aws_account_id.dkr.ecr.region.amazonaws.com/repository_name:version
```
![Pull Docker image](screenshots/docker_pull_repository.png)  
Create ***ECS Cluster***:  
![Create_cluster](screenshots/create_cluster.png)  
Create ***task definition***:  
![Create_task definition](screenshots/create_task_definition.png)  
Add **container** to the **task definition**:  
![Add container](screenshots/task_definition_add_container.png)  
Add my own **container** to the another **task definition**:   
![Add my own container](screenshots/add_own_container.png)  
Result:  
![Result](screenshots/result.png)  
  
  
------------
# Route 53
  
  
  
Create ***buckets*** with the ***domain*** name:  
![Create buckets with the domain name](screenshots/create_buckets_with_domain_name.png)  
Change ***bucket policy***:  
![Create bucket policy](screenshots/change_bucket_policy.png)  
Configure ***static website hosting***:  
![Configure static website hosting](screenshots/static_website_hosting.png)  
Configure ***redirect*** in *static website hosting*:  
![Configure redirect](screenshots/redirect.png)  
Create ***hosted zone*** in **Route 53**:  
![Create hosted zone](screenshots/create_hosted_zone.png)  
Create ***record with alias***:  
![Create record with alias](screenshots/create_record_alias.png)  
Total **Route 53** records in my domain:  
![Route 53 records](screenshots/route53_records.png)  
Result:  
yuhovdevops.pp.ua
![My site](screenshots/my_site.png)  


