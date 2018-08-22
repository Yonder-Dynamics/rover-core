
build:
	@docker build -t rover-core .

run: build
	@docker run  --name rover-core --rm rover-core

client:
	@docker run --rm -it --link rover-core:redis redis redis-cli -h redis -p 6379