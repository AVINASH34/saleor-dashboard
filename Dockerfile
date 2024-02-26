# Stage 1: Build dependencies
FROM node:18.19.1-slim as build
WORKDIR /app

# Copy package.json and package-lock.json separately to leverage Docker layer caching
COPY package.json package-lock.json ./
RUN npm install --legacy-peer-deps

# Copy the rest of the application files
COPY . .

# Stage 2: Final image
FROM gcr.io/distroless/nodejs18-debian12 as final

# Set the working directory
WORKDIR /app

# Copy the built files from the previous stage
COPY --from=build /app /app

# Expose the necessary port
EXPOSE 9000

# Define the command to run the application
CMD ["npm", "run", "dev"]
