#!/bin/sh

# Delete all PM2 processes
pm2 delete all

# Kill the process running on port 3000
lsof -i :3000 | awk 'NR!=1 {print $2}' | xargs kill

# Pull the latest changes from the git repository
git pull origin main

# Install the latest dependencies
yarn install

# Build the Next.js application
yarn build

# Start the PM2 process
pm2 start yarn --name "tilqanaty-main" -- start