# Use the lightweight official Nginx image
FROM nginx:alpine

# Copy the portfolio HTML into Nginx's web directory
COPY templates/index.html /usr/share/nginx/html/index.html

# Copy CSS, JavaScript, images and CV files
COPY static/ /usr/share/nginx/html/static/

# Nginx serves the website on port 80
EXPOSE 80

# Keep Nginx running in the foreground
CMD ["nginx", "-g", "daemon off;"]
