# Haskell greeter
My first cabal app created with great help of [this intro by Haskell at Work](https://youtu.be/a7R-2vtPLDM).

## Build
```bash
docker image build --build-arg EXEC_NAME=greeter --build-arg EXEC_VER=0.1.0.0 --tag haskell-greeter .
```

## Run
```bash
docker container run --rm haskell-greeter greeter Alice
# Hello, Alice!
```