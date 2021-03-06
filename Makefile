PACKAGE	= i3icons2
GOPATH	= $(CURDIR)/.gopath
GOBUILD	= $(CURDIR)/bin
GOBIN	= "/usr/local/bin/"
GOFILES	= $(wildcard *.go)
CONFIG 	= $(CURDIR)/icons.config
COPY 	= cp
CONFDIR	= "/etc/"

.PHONY: all
all:    get build

.PHONY: get build 
get:
	@GOPATH=$(GOPATH) GOBIN=$(GOBUILD) go get .

build:
	@echo "Building $(GOFILES)"
	@GOPATH=$(GOPATH) GOBIN=$(GOBUILD) go build -o $(GOBUILD)/$(PACKAGE) $(GOFILES)

.PHONY: install 
install:
	@GOPATH=$(GOPATH) GOBIN=$(GOBIN) go install $(GOFILES)
	${COPY} ${CONFIG} ${CONFDIR}/i3icons2.config

