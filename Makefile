SERVICE := mike200565

all: help

help: ## Show help messages
	@echo "Container - ${SERVICE} "
	@echo
	@echo "Usage:\tmake COMMAND"
	@echo
	@echo "Commands:"
	@sed -n '/##/s/\(.*\):.*##/  \1#/p' ${MAKEFILE_LIST} | grep -v "MAKEFILE_LIST" | column -t -c 2 -s '#'

deploy: ## Deploy
	flyctl deploy -a ${SERVICE}

conf secret: ## Upddate config
	flyctl secrets import -a ${SERVICE} < env

bash: ## Enter bash
	flyctl ssh console -a  ${SERVICE} -C /bin/bash
