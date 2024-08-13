# # build stage image
# FROM jekyll/jekyll:3.8 AS build-stage

# WORKDIR /srv/jekyll

# RUN gem install jekyll-redirect-from

# COPY package.json package-lock.json ./

# RUN npm ci

# COPY . .

# RUN jekyll build

# # actual image
# FROM nginx:alpine

# # copy built files to nginx
# COPY --from=build-stage /srv/jekyll/_site /usr/share/nginx/html

# # copy custom nginx config to support client-side routing
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# ----------------------------
# above is the proper way to do it, but we just serve the pre-built politicni-portret folder
# ----------------------------
FROM nginx:alpine

# copy built files to nginx
COPY politicni-portret /usr/share/nginx/html/politicni-portret

# copy custom nginx config to support client-side routing
COPY nginx.conf /etc/nginx/conf.d/default.conf
