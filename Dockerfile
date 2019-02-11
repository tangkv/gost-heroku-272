FROM alpine:3.6

ENV VER=2.7.2
ENV METHOD=chacha20
ENV PASSWORD=xausky
ENV PORT=8080

RUN apk add --no-cache curl \
  && curl -sL https://github.com/ginuerzh/gost/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && chmod +x gost_${VER}_linux_amd64/gost

CMD /gost_${VER}_linux_amd64/gost -L=ss+mws://$METHOD:$PASSWORD@:$PORT

