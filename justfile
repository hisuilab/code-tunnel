set shell := ["bash", "-euo", "pipefail", "-c"]

up:
    mkdir -p ~/Projects
    docker compose up -d

format:
    treefmt

check-format:
    treefmt --fail-on-change

precommit:
    ./scripts/precommit

check-docs:
    if [ -d docs ]; then rumdl check --config rumdl.toml docs/; fi
