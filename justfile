prepare:
    cargo install koji
    git config core.hooksPath .hooks

commit:
    koji
