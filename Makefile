GOBUILD=go build 
GOCLEAN=docker rmi
GOOS=GOOS="" 
GOARCH=GOARCH=""
REGISTRY=gcr.io
PROJECT=generated-armor-417415
APP=nethello
VERSION=v1.0


built: # default target
	$(GOBUILD)

linux: # Linux
	GOOS=linux GOARCH=amd64 $(GOBUILD)

windows: # Windows
	GOOS=windows GOARCH=amd64 $(GOBUILD)

darwin: # MacOS
	GOOS=darwin GOARCH=amd64 $(GOBUILD)

arm: # Arm
	GOOS=linux GOARCH=arm $(GOBUILD)

image: # Docker
	docker build  -t ${REGISTRY}/${PROJECT}/${APP}:${VERSION} .   

imagearm: # Docker_arm
	docker buildx build --platform linux/arm64 -t ${REGISTRY}/${PROJECT}/${APP}:${VERSION} . 

imageamd: # Docker_amd
	docker buildx build --platform linux/amd64 -t ${REGISTRY}/${PROJECT}/${APP}:${VERSION} . 

push: #push docker
	docker push ${REGISTRY}/${PROJECT}/${APP}:${VERSION}

clean:
	$(GOCLEAN) ${REGISTRY}/${PROJECT}/${APP}:${VERSION}
