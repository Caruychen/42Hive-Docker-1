# Build from Ruby
FROM	ruby

# Install dependencies
RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install -y sqlite3 npm

# Install rails
RUN		gem install rails

# Set working directory
WORKDIR	/opt/app

# Build app on downstream build
ONBUILD ADD	app /opt/app
ONBUILD RUN	nvm install 16.13.0
ONBUILD RUN	bundle install --without production
ONBUILD RUN	rails db:migrate

#docker build -t ft-rails:on-build .
#docker run -it	--rm ft-rails:on-build
