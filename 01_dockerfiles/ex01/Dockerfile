# Create image from Debian
FROM debian:latest

# Update packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install wget bzip2 sudo -y

# Add teamspeak as user
RUN adduser --disabled-login teamspeak

# Download and install teamspeak server into teamspeak home directory
RUN sudo su teamspeak && \
	cd /home/teamspeak && \
	wget https://files.teamspeak-services.com/releases/server/3.13.7/teamspeak3-server_linux_amd64-3.13.7.tar.bz2 && \
	tar xvf teamspeak3-server_linux_amd64-3.13.7.tar.bz2 && \
	rm teamspeak3-server_linux_amd64-3.13.7.tar.bz2 && \
	touch .ts3server_license_accepted

WORKDIR /home/teamspeak/teamspeak3-server_linux_amd64

