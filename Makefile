# Define variables
SRC := $(PWD)/cmd/goFlexNginx/main.go
OUT := $(PWD)/bin

build:
	@GOOS=linux GOARCH=amd64 go build -o $(OUT) $(SRC) > /dev/null
	@docker build -t nginx-crossplane . > /dev/null 2>&1
	@make clean
	@echo "Build successfully 🚀"

start bash: build
	@docker run --interactive --tty --rm --publish 3300:3300 nginx-crossplane $@

clean:
	@rm -f $(OUT)
