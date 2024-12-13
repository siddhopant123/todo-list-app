
# Step 1: Use a lightweight Node.js base image
FROM node:20-alpine

# Step 2: Set the working directory for the container
# This is where the app's files will be located
WORKDIR /app

# Step 3: Copy the application files from the host to the container
# The first "." refers to the current directory on the host
# The second "." refers to the current directory in the container (WORKDIR)
COPY . .

# Step 4: Install only production dependencies
# The '--production' flag skips devDependencies to reduce the container size
RUN yarn install --production

# Step 5: Specify the command to run the app
# The container will start by running 'node src/index.js'
CMD ["node", "src/index.js"]

# Step 6: Document the exposed port
# This is for reference; to access this port, you must publish it with `-p` when running the container
EXPOSE 3000
