build:
	@docker build -t c_dev -f Dockerfile .

docker:
	@docker run --rm -it -v ${PWD}/workspace:/mnt -w /mnt --name bash c_dev

run:
	@docker start c_dev
	@docker exec -it c_dev bash