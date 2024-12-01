# base image
FROM node:18

# set directory for container
WORKDIR /usr/src/app

# copy js file into container
COPY server.js .

# expose port 8080
EXPOSE 8080

# runs application 
CMD ["node", "server.js"]
