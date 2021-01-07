
#Build Stage 1

FROM node:12 AS appbuild
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

#Build Stage 2

FROM node:12
WORKDIR /usr/src/app
COPY --from=appbuild /usr/src/app/ /usr/src/app/
EXPOSE 5000
CMD [ "node", "server.js" ]



# Single Stage build

#FROM node:12
# Create app directory
#	WORKDIR /usr/src/app
# Install app dependencies
#	COPY package*.json ./
#RUN npm install
# If you are building your code for production
# 	RUN npm ci --only=production
# Bundle app source
#	COPY . .
#	EXPOSE 5000
#	CMD [ "node", "server.js" ]


