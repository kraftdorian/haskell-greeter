FROM haskell:9.0.1-buster AS builder

# Executable name
ARG EXEC_NAME

# Executable version
ARG EXEC_VER

WORKDIR /opt/$EXEC_NAME

RUN cabal new-update

COPY . .

RUN cabal new-build

FROM alpine:3.15.0 as runner

ARG EXEC_NAME
ARG EXEC_VER

WORKDIR /opt/$EXEC_NAME

# Check https://serverfault.com/a/883665
# gmp-dev is needed by the binary
RUN apk add --no-cache libc6-compat gmp-dev

COPY --from=builder \
  /opt/$EXEC_NAME/dist-newstyle/build/x86_64-linux/ghc-9.0.1/${EXEC_NAME}-${EXEC_VER}/x/$EXEC_NAME/build/$EXEC_NAME/$EXEC_NAME \
  /usr/local/bin/

CMD ["$EXEC_NAME"]