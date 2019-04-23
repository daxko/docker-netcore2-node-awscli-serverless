FROM microsoft/dotnet:2.1.301-sdk

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential g++ python2.7 python2.7-dev unzip curl \
    python-pip python-setuptools gnupg2 groff zip jq nuget \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp \
    && cd /tmp \
    && pip install awscli \
    && rm -f /tmp/get-pip.py \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt install nodejs \
    && rm -rf /usr/lib/systemd/* \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && node -v \
    && npm install serverless jest -g \
    && chmod -R a+wx /usr/share/dotnet/sdk/ \
# update version of npm that has `npm ci` command
# latest version available at the time
    && npm install npm@6.4.1 -g
 
