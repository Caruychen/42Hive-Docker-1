# Build from Ruby
FROM	ruby:3.1.2

# Install dependencies
RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install -y sqlite3 nodejs npm

# Set working directory
WORKDIR	/opt/app

# Build app on downstream build
ONBUILD ADD	app /opt/app
ONBUILD RUN gem install bundler -v 2.3.14
ONBUILD RUN	bundle _2.3.14_ config set --local without 'production'
ONBUILD RUN bundle _2.3.14_ install
ONBUILD RUN	rails db:migrate

#docker run -it	--rm ft-rails:on-build
