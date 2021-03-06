ALL_PACKAGES=$(shell go list ./... | grep -v "vendor")

fmt:
	go fmt $(ALL_PACKAGES)

vet:
	go vet $(ALL_PACKAGES)

tidy:
	go mod tidy

serve: fmt vet
	env go run cmd/*.go

build: fmt vet
	cd cmd; go build -o ../out/rptat .

run: build
	./out/rptat ./config.toml
