# Handy script to get docker ip's more easily
docker-ip() {
  if [ $# -eq 0 ]; then
    docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
  else
    docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
  fi
}
