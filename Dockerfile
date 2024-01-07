FROM node:21 AS builder
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY . .
RUN yarn
RUN yarn build


# Install dependencies
FROM node:21-alpine

# Copy the rest of the application code to the working directory
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

CMD ["yarn", "start"]
