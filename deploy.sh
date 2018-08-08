#!/bin/sh

USER=dsbd
HOST=leg.ufpr.br
DIR=/home/dsbd/

hugo && rsync -avz public/ ${USER}@${HOST}:${DIR}

exit 0
