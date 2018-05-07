#
# A simple Makefile to easily build, test and run the code
#

.PHONY: default build fmt lint run run_race test clean vet docker_build docker_run docker_clean

APP_NAME := stellite-blockchain-downloader

default: build

build:
	go build -o ./bin/${APP_NAME} ./src/main.go


run: build
	LOG_FORMAT=Text \
	LOG_LEVEL=Debug \
	./bin/${APP_NAME}

run_race:
	LOG_OUTPUT=Text \
	LOG_LEVEL=Debug \
	go run -race ./src/main.go

clean:
	rm ./bin/*