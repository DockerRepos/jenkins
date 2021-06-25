# Jenkins

Modificar el servicio /lib/systemd/system/docker.service incluyendo/modificando la siguiente línea:
* ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock
 
Lanzar el contenedor con el siguiente comando:
* docker run --name jenkins-clr --user root -d -p 8080:8080 -p 50000:50000 -v jenkins-volume:/var/jenkins_home/ -v /var/run/docker.sock:/var/run/docker.sock cleondock/jenkins:1
