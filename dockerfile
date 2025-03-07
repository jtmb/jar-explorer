FROM nginx:latest

# Create the directory for serving files
RUN mkdir -p /usr/share/nginx/html/files \
    && chmod -R 755 /usr/share/nginx/html/files

# Copy custom NGINX config to enable autoindex
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Copy index.html and background image to the NGINX root directory
COPY static-site/index.html /usr/share/nginx/html/index.html
COPY static-site/background.jpg /usr/share/nginx/html/background.jpg

# Expose port 80
EXPOSE 80
WORKDIR /usr/share/nginx/html/files
# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
