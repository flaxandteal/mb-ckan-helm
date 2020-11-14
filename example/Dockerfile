FROM flaxandteal/ckan:2.8.4

ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=$GITHUB_TOKEN

ADD build.sh /
# This will be overwritten at runtime,
# but gives a way of configuring for testing
# in docker-compose
RUN /bin/bash /build.sh

ADD production.ini /etc/ckan
