docker image rm cchen/ex03
docker build -t cchen/ex03 .
docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --memory="8g" --cpus="3" --privileged -e GITLAB_ROOT_PASSWORD="12341234" cchen/ex03
