#docker-ansible-tower
#www.GitHub.com/jmhardison/docker-ansible-tower

FROM ubuntu:14.04

MAINTAINER Jonathan Hardison <jmh@jonathanhardison.com>

#VOLUMES
#VOLUME ["/var/something"]

#Expose used ports for Ansible tower
EXPOSE 443 8080 80

#ENV
ENV DEBIAN_FRONTEND noninteractive

#RUN
#ADD 'latest' release.
ADD http://releases.ansible.com/awx/setup/ansible-tower-setup-latest.tar.gz /opt/ansible-tower-setup-latest.tar.gz

#Extract
RUN  tar -xvzf ansible-tower-setup-latest.tar.gz /opt/ansible-tower-setup

#setup
RUN cd /opt/ansible-tower-setup && ./setup.sh

#Add entrypoint file
ADD docker-entrypoint.sh /docker-entrypoint.sh

#Enable execution one entrypoint
RUN chmod +x /docker-entrypoint.sh



#Set Entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

#execute entrypoint with command.
CMD


