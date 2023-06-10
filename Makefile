run:
	go run ./main.go

ci_go:
	act --container-architecture linux/amd64 --workflows .github/workflows/ci.yml

ci_tf:
	act --container-architecture linux/amd64 --workflows .github/workflows/tf_plan.yml