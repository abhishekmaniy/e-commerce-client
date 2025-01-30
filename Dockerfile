# Use the official Node.js image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY client/package.json client/package-lock.json ./
RUN npm install

# Copy the rest of the app files
COPY client/ .

# Build the React app
RUN npm run build

# Serve the app using a lightweight HTTP server
CMD ["npx", "serve", "-s", "build"]
