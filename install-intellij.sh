#!/usr/bin/env bash

sudo sh -c "bash <(curl -L https://gist.githubusercontent.com/voor/b2dd473db296d9eae004/raw/6a4a1dc82774f9450b359d68881e94e780321ae5/install-java-8.sh)"

curl -L -o ~/Downloads/ideaIU-15.0.4.tar.gz https://download.jetbrains.com/idea/ideaIU-15.0.4.tar.gz \
  && tar -xvf ~/Downloads/ideaIU-15.0.4.tar.gz -C ~/ \
  && mv ~/idea-IU-* ~/idea
