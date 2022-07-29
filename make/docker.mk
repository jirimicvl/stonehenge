PHONY += docker-build
docker-build: ## Build Stonehenge Docker image locally
	$(call step,Build Stonehenge Docker image locally...)
	@docker buildx bake -f docker-bake.hcl --pull --progress plain --no-cache --load --set *.platform=linux/arm64

PHONY += docker-release
docker-release: ## Build and push Stonehenge Docker image
	$(call step,Build and push Stonehenge Docker image...)
	@docker buildx bake -f docker-bake.hcl --pull --no-cache --push
