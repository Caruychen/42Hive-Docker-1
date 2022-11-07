# Build image
docker build -t cchen/ex01 .

# Run container
docker run -it --rm -p=9987:9987/udp  -p=10011:10011 -p=30033:30033 cchen/ex01
