# Let's start from void, no base layer referenced with FROM
FROM scratch

# Labels and OCP specific annotations
LABEL io.k8s.description="Caddy server static build image." \
      io.k8s.display-name="Caddy v2.4.1" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="html,httpd,caddy"

# Copy all given resources (caddy bin, config files, sites, certs, etc..) to / root directory
COPY * /

# Execute container as root-less
USER 1001

# Expose server port number
EXPOSE 8080

# Set current directory
WORKDIR /

# Default entry, requires config file and/or content @ root dir
CMD ["/caddy", "run"]