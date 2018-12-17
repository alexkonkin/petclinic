The original url of the project that has been containerized in this solution:
https://github.com/spring-projects/spring-petclinic

To run the application:
- update .env file and set the IPs for nginx and mysql servers:
  ip of nginx service is rerpesented by variable: IP_EXT=<your external IP>
  ip of mysql service is represented by variable: IP_INT=<your internal IP>
- define environment variable NGINX_CONF then build and run
  containers bu executing the command:
  export NGINX_CONF=$(cat conf/nginx/nginx.conf) && docker-compose build ngnx

Containers are set to start up in case of the system reboot.



