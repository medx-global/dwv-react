# Multi-stage build for production
# Stage 1: Build the application
FROM node:22 as build

# Set working directory
WORKDIR /app

# Install system dependencies required for canvas and other native packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    pkg-config \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application for production with /dicom path
RUN npm run build-dicom

# Stage 2: Serve the application with nginx
FROM nginx:alpine

# Copy the built application from the build stage
COPY --from=build /app/build /usr/share/nginx/html/dicom

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
