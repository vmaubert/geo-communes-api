FROM node:alpine
LABEL maintainer=francois.romain@beta.gouv.fr

ENV dir /app
WORKDIR $dir

# cache node_modules if no changes to package.json
# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
COPY package.json /tmp/package.json
RUN cd /tmp && npm install --production && cp -a /tmp/node_modules $dir/

COPY package*.json ./
COPY index.js ./
COPY lib lib/

CMD npm run start
