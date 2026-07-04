FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY . .

RUN mv "Ahnoud Tech Landing.dc.html" index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
