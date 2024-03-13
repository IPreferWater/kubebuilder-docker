# context

[kubebuilder](https://book.kubebuilder.io) doesn't support windows ([issue open](https://github.com/kubernetes-sigs/kubebuilder/issues/2940)), it's possible to use it without WSL using only Docker

## quick explication

- we use a Dockerfile with kubebuilder inside
- we use the docker-compose to mount the volume from your local to /home in the container (if you don't want to use docker-compose, you can just start the container with -v option)

```
docker run -it -v $(pwd)/kubebuilder:/home your-image-name:your-image-tag tail -f /dev/null
```

now you can run your cmd that use kubebuilder and still code on windows
### example from kubebuilder's quick start

```
mkdir memcached-operator &&
cd memcached-operator &&
go mod init example.com/m &&
kubebuilder init --domain=example.com &&
```