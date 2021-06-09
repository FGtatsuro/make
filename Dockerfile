FROM alpine:latest as downloader

RUN wget -q https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
RUN unzip terraform_1.0.0_linux_amd64.zip
RUN chmod a+x terraform
RUN mv terraform /tmp

RUN wget -q -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.0.1/kustomize_v4.0.1_linux_amd64.tar.gz | tar xvzf -
RUN chmod a+x kustomize
RUN mv kustomize /tmp

RUN wget -q "https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod a+x kubectl
RUN mv kubectl /tmp


FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine as runner
RUN apk --no-cache add make
COPY --from=downloader /tmp /usr/local/bin

ENTRYPOINT ["make"]
