# Use the official Node.js image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code to the container's working directory
COPY . /app

# Install application dependencies
RUN npm install
RUN npm install -g @nrwl/cli
RUN npm install npx

# Check linting
RUN npx nx run nft-bridge:lint

# Run e2e tests
# RUN npx jest

# Build the project
RUN nx build nft-bridge

# Set the command to run the application
CMD ["node", "./dist/apps/nft-bridge/main.js"]
