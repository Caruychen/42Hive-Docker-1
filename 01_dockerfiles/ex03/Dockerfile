# From Debian container
FROM	debian

# Update package installer
RUN	apt-get update -y && \
	DEBIAN_FRONTEND=noninteractive && \
	apt-get upgrade -y

# Install GitLab server dependencies
RUN	apt-get install -y curl vim openssh-server ca-certificates

# Add  GitLab respository and install the package
RUN	curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

RUN apt-get install -y gitlab-ce && \
	mkdir -p /etc/gitlab/ssl && \
	chmod 755 /etc/gitlab/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj "/CN=gitlab.example.com" \
	-keyout /etc/gitlab/ssl/gitlab.example.com.key -out /etc/gitlab/ssl/gitlab.example.com.crt && \
	echo "external_url \"https://gitlab.example.com\"" >> /etc/gitlab/gitlab.rb && \
	echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.example.com.crt\"" >> /etc/gitlab/gitlab.rb && \
	echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.example.com.key\"" >> /etc/gitlab/gitlab.rb && \
	echo "gitlab_rails['gitlab_shell_ssh_port'] = 8022" >> /etc/gitlab/gitlab.rb

EXPOSE 443 80 22

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && service ssh restart && gitlab-ctl tail

#docker build -t cchen/ex03 .
#docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --memory="8g" --cpus="3" --privileged -e GITLAB_ROOT_PASSWORD="12341234" cchen/ex03
