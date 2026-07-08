# AGENTS

## コミットメッセージ

- 英語で、[Conventional Commits](https://www.conventionalcommits.org/)形式(`type(scope): description`)で書きます
- `type`は`build`/`chore`/`ci`/`docs`/`feat`/`fix`/`perf`/`refactor`/`revert`/`style`/`test`のいずれかを使います
- この形式は`.pre-commit-config.yaml`の`conventional-pre-commit`フック(`--strict`)で強制されており、違反するコミットは`commit-msg`フックで拒否されます
