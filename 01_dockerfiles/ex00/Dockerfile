# Create from alpine image
FROM alpine

# Update apt packages
RUN apk update && apk upgrade

# Add vim container
RUN apk add vim

# Launch VIM on startup
ENTRYPOINT ["vim"]

#docker build -t ex00/cchen .
# docker run -it --rm ex00/cchen
