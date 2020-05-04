# usage: docker-ip <container id>
alias docker-ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
