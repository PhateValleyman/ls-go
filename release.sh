#!/data/data/com.termux/files/usr/bin/bash
set -ex

if ! command -v github-release >/dev/null; then
  echo must install github-release
  echo go get github.com/github-release/github-release
  exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
  echo must set GITHUB_TOKEN >&2
  exit 1
fi

TAG=0.2.1_by_PhateValleyman

git tag -a v$TAG -m "release v$TAG"

git push origin master --tags

./compile

github-release release \
  --user PhateValleyman \
  --repo ls-go \
  --tag v$TAG \
  --name ls-go


github-release upload \
  --user PhateValleyman \
  --repo ls-go \
  --tag v$TAG \
  --name ls-go \
  --file ls-go
