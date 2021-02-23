FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

RUN apk --no-cache add make
RUN wget -q "https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip" && unzip terraform_0.14.6_linux_amd64.zip && \
       rm terraform_0.14.6_linux_amd64.zip; mv terraform /usr/bin && chmod a+x /usr/bin/terraform; \
    wget -q "https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
       mv kubectl /usr/bin && chmod a+x /usr/bin/kubectl; \
    wget -q -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.0.1/kustomize_v4.0.1_linux_amd64.tar.gz | tar xvzf - && \
       mv kustomize /usr/bin && chmod a+x /usr/bin/kustomize

ENTRYPOINT ["make"]
