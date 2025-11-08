FROM node:18-alpine
WORKDIR /app


COPY package*.json ./
RUN npm install
RUN npm  install express
# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3001


# Command to run node.js in a docker container
CMD ["node", "index.js"]
