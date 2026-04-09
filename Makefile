build:
	@docker build -t c_dev -f Dockerfile .

docker:
	@docker run --rm -it -v ${PWD}/workspace:/home/ubuntu/workspace --name c_dev c_dev

run:
	@docker start c_dev
	@docker exec -it c_dev bash