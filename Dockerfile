# Use official Node.js image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# App binds to port 3000
EXPOSE 3000

# Run app
CMD [ "node", "app.js" ]
