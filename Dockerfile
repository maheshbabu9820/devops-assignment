# Stage 1: Build the application
FROM node:16 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN npx nx build nft-bridge

# Stage 2: Create the final image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy the build artifacts from the builder stage
COPY --from=builder /app/dist/apps/nft-bridge ./dist/apps/nft-bridge
COPY --from=builder /app/node_modules ./node_modules

# Expose the port used by the application (if needed)
EXPOSE 3000

# Set the command to run the application
CMD ["node", "./dist/apps/nft-bridge/main.js"]


# Build the project
RUN nx build nft-bridge

# Set the command to run the application
CMD ["node", "./dist/apps/nft-bridge/main.js"]
