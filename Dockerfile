#  Dockerfile for hugo-alpine3 s2i builder
FROM alpine:3.14

# Labels and OCP s2i specific annotations
LABEL io.k8s.description="Hugo static site generator s2i builder image." \
      io.k8s.display-name="Hugo v0.84.3" \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i" \
      io.openshift.expose-services="1313:http" \
      io.openshift.tags="builder,md,markdown,hugo"

# Copy the S2I scripts to /usr/libexec/s2i according to label above
COPY ./s2i/bin/ /usr/local/s2i

RUN adduser -u 1001 -h /home/hugo -D -s /sbin/nologin default root && \
    mkdir -p /home/hugo && \
    chown -R 1001:0 /home/hugo && chmod -R g+rwX /home/hugo

# Install required packages
RUN apk add --no-cache git && \
    apk add --no-cache hugo

# Set working directory
WORKDIR /home/hugo

# Set the default port for applications built using this image
EXPOSE 1313

# Use un-privileged user
USER 1001

# Set the default CMD for the image
CMD ["/usr/local/s2i/usage"]
