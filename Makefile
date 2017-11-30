publish:
	@echo "Publishing image ${VERSION}"
	@docker build -t cf-waits:${VERSION} .
	@docker tag cf-waits:${VERSION} ${ECR_REPO_ID}.dkr.ecr.us-east-1.amazonaws.com/cf-waits:${VERSION}
	@docker push ${ECR_REPO_ID}.dkr.ecr.us-east-1.amazonaws.com/cf-waits:${VERSION}
	@echo "Image published"

deploy:
	@aws cloudformation update-stack --stack-name cf-waits-application --use-previous-template --parameters ParameterKey=WaitsVersion,ParameterValue=${VERSION}
