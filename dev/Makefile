validate:
	terraform validate

fmt: validate
	terraform fmt -recursive	

plan: fmt
	terraform plan

app:
	terraform apply -auto-approve

des:
	terraform destroy -auto-approve

graph:
	terraform graph -draw-cycles -type=apply | dot -Tjpg > graph.jpg