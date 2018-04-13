FROM microsoft/dotnet:2.0.6-sdk-2.1.104

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential g++ python2.7 python2.7-dev unzip curl \
    python-pip python-setuptools gnupg2 groff zip \
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
    && npm install serverless jest -g
    && chmod -R a+wx /usr/share/dotnet/sdk/