TAG := $(or $(TAG),latest)

build:
	docker build -t sample-smile-app:$(TAG) .

run: build
	docker compose up -d

bump:
	VERSION=$$(cat VERSION | xargs); \
	MAJOR=$$(echo $${VERSION} | cut -d. -f1); \
	MINOR=$$(echo $${VERSION} | cut -d. -f2); \
	PATCH=$$(echo $${VERSION} | cut -d. -f3); \
	PATCH=$$(($${PATCH} + 1)); \
	echo "$${MAJOR}.$${MINOR}.$${PATCH}" > VERSION

publish: build bump
	VERSION=$$(cat VERSION | xargs); \
	echo "Publishing version $${VERSION}"; \
	docker tag sample-smile-app:$(TAG) miladbeigi/sample-smile-app:$${VERSION}; \
	docker push miladbeigi/sample-smile-app:$${VERSION}

clean:
	docker rmi sample-smile-app:$(TAG) --force

help:
	@echo "build - Build the docker image"
	@echo "bump - Bump the version"
	@echo "publish - Publish the docker image"
	@echo "clean - Remove the docker image"