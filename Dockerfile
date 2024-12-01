FROM jenkins/jenkins:2.462.3-jdk17
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins 'blueocean docker-workflow gitlab-plugin token-macro cloudbees-folder'
#HEALTHCHECK --interval=1m --timeout=3s CMD curl -f http://admin:password@172.17.0.3:8080/api/json || exit 1 
