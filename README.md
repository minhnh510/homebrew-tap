# KeepItClean Homebrew Tap

Official Homebrew tap for [KeepItClean](https://github.com/minhnh510/keepitclean),
a safety-first macOS developer storage cleaner.

## Install

```bash
brew install minhnh510/tap/keepitclean
keep --version
keep
```

The fully qualified install trusts only the KeepItClean formula, not every item
that may be added to this tap later.

## Upgrade

```bash
brew update
brew upgrade minhnh510/tap/keepitclean
```

## Optional System Clean helper

The normal and hardcore developer cleanup flows are user-scoped and do not need
administrator access. Homebrew never installs the privileged helper implicitly.
After reviewing the helper source and Formula caveats, install it explicitly:

```bash
"$(brew --prefix keepitclean)/libexec/install-helper.sh"
```

## Uninstall

```bash
brew uninstall keepitclean
brew untap minhnh510/tap
```

## Brewfile

```ruby
tap "minhnh510/tap"
brew "keepitclean"
```

## Release integrity

The Formula pins the immutable GitHub release URL and SHA-256 checksum. v0.1.0
is ad-hoc signed and not Apple-notarized; see the
[release notes](https://github.com/minhnh510/keepitclean/releases/tag/v0.1.0)
and [security design](https://github.com/minhnh510/keepitclean/blob/main/docs/SECURITY_DESIGN.md).
