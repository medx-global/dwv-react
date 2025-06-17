# Use Node.js 22 with Ubuntu base for better compatibility with native packages
FROM node:22

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

# Expose the port that Vite dev server runs on
EXPOSE 3000

# Start the development server
CMD ["npm", "run", "start", "--", "--host", "0.0.0.0"]
