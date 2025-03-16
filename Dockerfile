# Use the official Node.js image as the base
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy dependency definitions first for caching purposes
COPY package*.json ./

# Install dependencies (this layer is cached until package*.json changes)
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the necessary ports for the Mindcraft service
EXPOSE 3000 3001 3002 3003

# Command to start the application
CMD ["node", "main.js"]
