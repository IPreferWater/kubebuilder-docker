FROM golang:1.21.8-alpine3.19

RUN apk --no-cache add make
RUN apk --no-cache add bash

# https://book.kubebuilder.io/quick-start
RUN wget --output-document=kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)'/'$(go env GOARCH) \
     && chmod +x kubebuilder \
     && mv kubebuilder /usr/local/bin/ 

WORKDIR /home