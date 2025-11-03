# Stage 1: Use a lightweight web server image
FROM nginx:alpine

# Copy the build output from your local dist/ folder into nginx’s web root
COPY dist/ /usr/share/nginx/html

# (Optional) Copy a custom NGINX config if needed
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose the default HTTP port
EXPOSE 3000

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
