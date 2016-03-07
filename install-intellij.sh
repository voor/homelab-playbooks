#!/usr/bin/env bash

curl -L -o ~/Downloads/ideaIU-15.0.4.tar.gz ideaIU-15.0.4.tar.gz https://download.jetbrains.com/idea/ideaIU-15.0.4.tar.gz \
  && tar -xvf ~/Downloads/ideaIU-15.0.4.tar.gz -C ~/ \
  && mv ~/idea-IU-* ~/idea
