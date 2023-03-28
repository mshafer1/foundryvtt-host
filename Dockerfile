FROM alpine:3.13

# Set the foundry install home
RUN adduser -D foundry
RUN mkdir -p /home/foundry/fvtt
RUN mkdir -p /home/foundry/fvttdata

ENV FOUNDRY_HOME=/home/foundry/fvtt
ENV FOUNDRY_DATA=/home/foundry/fvttdata

ARG NODEJS_VERSION=18.15.0-r0
RUN apk add --update nodejs=${NODEJS_VERSION}

# Set the current working directory
WORKDIR "${FOUNDRY_HOME}"

#copy found
ARG FOUNDRY_VERSION=10.291
ARG FOUNDRY_DIR=.
COPY ${FOUNDRY_DIR}/FoundryVTT-${FOUNDRY_VERSION}.zip .

#unzip
RUN unzip FoundryVTT*.zip
RUN rm FoundryVTT*.zip

EXPOSE 30000
CMD node ${FOUNDRY_HOME}/resources/app/main.js --dataPath=${FOUNDRY_DATA}