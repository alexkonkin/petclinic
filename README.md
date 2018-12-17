To run the application:
- execute the command that defines an environment variable:
  export NGINX_CONF=$(cat conf/nginx/nginx.conf)
  export IP_EXT=<your external IP>
  export IP_INT=<your internal IP>
- run the command:
  docker-compose up -d

