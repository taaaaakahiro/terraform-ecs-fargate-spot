run:
	go run ./main.go

ci:
	act --container-architecture linux/amd64 --secret-file .env --workflows .github/workflows/ci.yml