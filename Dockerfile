# Use official Node.js base image with Debian
FROM node:18

# Install FFmpeg (includes ffmpeg + ffprobe)
RUN apt-get update && apt-get install -y ffmpeg

# Set working directory inside container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app
COPY . .

# Make sure output directory exists
RUN mkdir -p /app/output

# Run the Node.js script
CMD ["node", "index.js"]
