# devbox-docker

Development environments in docker containers, for rationale see [blogpost](http://martintrojer.github.io/software/2015/02/22/moving-my-devboxes-to-docker/).

## Hybrid

A golang development environment, where your editor/IDE is outside the container, and the source folders is shared.

## All-in

A multi-user, java (remove) development environment with editor built-in. Has support for screen-sharing (wemux).

## Usage

Docker (>=1.5.0)

`$ make build-all` to build the containters.

`$ make connect-local` to launch a bash shell in local container.

`$ make run-remove` to run the 'remove' container, use ssh to connect.
