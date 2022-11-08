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

RUN apt-get install -y gitlab-ce

EXPOSE 443 80 22

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && gitlab-ctl tail
