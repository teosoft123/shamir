#!/bin/bash

GOROOT=/Users/oleg/go/pkg/mod/golang.org/toolchain@v0.0.1-go1.22.3.darwin-arm64
GOPATH=/Users/oleg/go

echo "GOOS: $GOOS"
echo "GOARCH: $GOARCH"
echo "VERSION: $VERSION"

OUTPUT_NAME="shamir"
GOOS="${1:=linux}"
GOARCH="${2:=amd64}"
VERSION="${3:=0_0_0}"

echo "GOOS: $GOOS"
echo "GOARCH: $GOARCH"
echo "VERSION: $VERSION"

# Build the executable
filename="${OUTPUT_NAME}-${GOOS}-${GOARCH}-${VERSION}"
if [ "$GOOS" = "windows" ]; then
    filename="${filename}.exe"
fi

GOARCH=$GOARCH GOOS=$GOOS go build -o "$filename" ./cmd/shamir/main.go

echo "Build complete: $filename"
