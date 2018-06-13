ARG builder=wire-desktop-builder:debian9
ARG deps=wire-desktop-deps:debian9

FROM ${builder} as builder

RUN mkdir /src && cd /src && git clone https://github.com/wireapp/wire-desktop.git && cd wire-desktop

WORKDIR /src/wire-desktop

RUN npm install --unsafe-perm

RUN npm run build:linux

FROM ${deps}

COPY --from=builder /src/wire-desktop/wrap/dist/*.deb /dist/
