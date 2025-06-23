# Use the official Nginx image as the base
FROM nginx:latest

# Remove the default Nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy my web app files into the Nginx web root
COPY . /usr/share/nginx/html/

# Expose port 80 (HTTP)
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
