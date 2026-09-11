FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       openssh-client \
       docker-cli \
    && rm -rf /var/lib/apt/lists/*

    ##플러그인 이미지에 포함 
COPY --chown=jenkins:jenkins plugins.txt \
    /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli \
    --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins
