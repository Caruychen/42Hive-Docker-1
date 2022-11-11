# Create from alpine image
FROM alpine

# Update apt packages
RUN apk update && apk upgrade

# Add vim container
RUN apk add vim

# Launch VIM on startup
ENTRYPOINT ["vim"]
