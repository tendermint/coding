.PHONEY: tools

STD_TOOLS := \
	golang.org/x/tools/cmd/gotype \
	golang.org/x/tools/cmd/goimports \
	golang.org/x/tools/cmd/godoc \
	golang.org/x/tools/cmd/gorename \
	golang.org/x/tools/cmd/gomvpkg \
	github.com/golang/lint/golint


EXTRA_TOOLS := \
	github.com/ebuchman/got \
	github.com/dominikh/go-structlayout

tools:
	go get $(STD_TOOLS)
	go get $(EXTRA_TOOLS)
