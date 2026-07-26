# Homebrew Cask for SystemEQ for Mac

> 🇬🇧 English | 🇮🇹 [Italiano](README.it.md) | 🇺🇦 [Українська](README.ua.md)

System-wide parametric equalizer for macOS 13+ — [main repository](https://github.com/denzam/SystemEQ-for-Mac).

## Installation

```bash
brew tap denzam/systemeq
brew trust denzam/systemeq
brew install --cask systemeq
```

Since Homebrew 6.0, third-party taps must be trusted explicitly before Homebrew
will load them — without `brew trust` the install fails with
`Refusing to load cask ... from untrusted tap`. A tap owner cannot grant this on
your behalf, so it is a one-time command on each Mac. On Homebrew 5 and older the
command does not exist; skip it there.

The cask automatically removes the macOS quarantine attribute on install, so the
app launches without any Gatekeeper warning (SystemEQ is ad-hoc signed, not
notarized with an Apple Developer ID — see the [main README](https://github.com/denzam/SystemEQ-for-Mac#installation)
for the rationale).

## Update

```bash
brew upgrade --cask systemeq
```

## Uninstall

```bash
brew uninstall --cask systemeq
```

The cask's `zap` stanza also cleans up Application Support, Preferences and Caches:

```bash
brew uninstall --cask --zap systemeq
```

## Requirements

- macOS 13 (Ventura) or later
- Apple Silicon or Intel Mac
- [BlackHole 2ch](https://github.com/ExistentialAudio/BlackHole) (free virtual audio driver, installed via the in-app Setup Assistant)

## For maintainers — updating the cask after a new release

1. Wait for the GitHub release workflow to publish `SystemEQ-v<version>.dmg`.
2. Compute the SHA-256 of the published DMG:
   ```bash
   curl -sL https://github.com/denzam/SystemEQ-for-Mac/releases/download/v<version>/SystemEQ-v<version>.dmg | shasum -a 256
   ```
3. In `Casks/systemeq.rb` bump `version` and replace `sha256`.
4. Commit and push:
   ```bash
   git commit -am "Bump SystemEQ to v<version>"
   git push
   ```
5. Verify locally:
   ```bash
   brew update
   brew info --cask denzam/systemeq/systemeq
   ```

## License

The cask formula in this repository is released under the same license as
SystemEQ for Mac itself — [GNU GPL v3](https://github.com/denzam/SystemEQ-for-Mac/blob/main/LICENSE).
