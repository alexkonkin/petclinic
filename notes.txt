yum install git -y
yum install which -y
yum install --nogpgcheck -y java-1.8.0-openjdk-devel
git clone https://github.com/spring-projects/spring-petclinic /opt/petclinic
cd /opt/petclinic
./mvnw package



docker build -f dockerfiles/Dockerfile.app -t petclinic .
docker build -f dockerfiles/Dockerfile.nginx -t nginx .
docker run -it --rm --name=app -p 8080:8080 petclinic:latest
docker build -f dockerfiles/Dockerfile.nginx -t nginx --build-arg NGINX_CONF="$(cat conf/nginx/nginx.conf)" .

docker run -it --name ngnx --entrypoint bash nginx:latest
docker run -it --name ngnx --rm --entrypoint bash -p 80:80 nginx:latest

-----
yum install --nogpgcheck -y epel-release nginx &&\
systemctl enable nginx

docker exec -it app sh

-------
remove unnamed images
docker rmi $(docker image ls|awk '{print $1" "$3}'|grep '<none>'|awk '{print $2}')


