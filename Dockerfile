FROM alpine:latest
RUN apk add curl git openssh \
  && git config --global url.ssh://git@github.com/.insteadOf https://github.com/ 
RUN  curl -L --output /tmp/kustomize_v3.9.1_linux_amd64.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.9.1/kustomize_v3.9.1_linux_amd64.tar.gz \
  && echo "0fb2c3299ca3668205eac3a3a5be9a8e4a79d7c4fba18542a6c444e0d33ddbdd  /tmp/kustomize_v3.9.1_linux_amd64.tar.gz" | sha256sum -c \
  && tar -xvzf /tmp/kustomize_v3.9.1_linux_amd64.tar.gz -C /usr/local/bin \
  && chmod +x /usr/local/bin/kustomize
WORKDIR /kustomize
