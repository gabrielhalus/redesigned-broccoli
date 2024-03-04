build:
	@GOOS=linux GOARCH=amd64 go build -o .app/main cmd/goFlexNginx/main.go > /dev/null
	@docker build -t nginx-crossplane:latest . > /dev/null 2>&1
	@echo "Build successfully 🚀"

run: build
	@docker run -it --rm --name dev -p 3000:3000 -v $(PWD)/.app:/app nginx-crossplane

bash: build
	@docker run -it --rm --name dev -v $(PWD)/.app:/app nginx-crossplane bash
