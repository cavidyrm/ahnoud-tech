FROM caddy:alpine

WORKDIR /srv

COPY . .

RUN mv "Ahnoud Tech Landing.dc.html" index.html

EXPOSE 80

CMD ["caddy", "file-server", "--root", "/srv", "--listen", ":80"]
