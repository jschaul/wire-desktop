FROM fedora:28

RUN dnf install -y \
    npm nodejs glibc-devel glibc-devel.i686 \
    libstdc++-devel libstdc++-devel.i686 clang gcc-c++ \
    git compat-readline6

RUN ln -s /usr/lib64/libbz2.so.1 /usr/lib64/libbz2.so.1.0

RUN mkdir /src && cd /src && git clone https://github.com/wireapp/wire-desktop.git && cd wire-desktop

WORKDIR /src/wire-desktop

RUN dnf install -y python

RUN npm install --unsafe-perm

RUN npm install -g webpack grunt

RUN npm run build:linux
