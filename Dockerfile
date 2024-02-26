# Build stage
FROM node:18.19.1-slim as build
WORKDIR /temp
COPY package.json package-lock.json /temp/
RUN npm install

# Copy only application code
COPY . /temp

# Final stage
FROM gcr.io/distroless/nodejs18-debian12 as final
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=build /temp /app

EXPOSE 9000
CMD ["npm", "run", "dev"]
