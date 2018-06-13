TAG    := debian9

default: builder deps deb

.PHONY: builder
builder:
	docker build -t wire-desktop-builder:$(TAG) -f Dockerfile.builder .

.PHONY: deps
deps:
	docker build -t wire-desktop-deps:$(TAG) -f Dockerfile.deps .

.PHONY: deb
deb:
	docker build -t wire-desktop:$(TAG) -f Dockerfile .
