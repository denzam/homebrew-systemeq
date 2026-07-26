# Homebrew Cask per SystemEQ for Mac

> 🇮🇹 Italiano | 🇬🇧 [English](README.md) | 🇺🇦 [Українська](README.ua.md)

Equalizzatore parametrico a livello di sistema per macOS 13+ — [repository principale](https://github.com/denzam/SystemEQ-for-Mac).

## Installazione

```bash
brew tap denzam/systemeq
brew trust denzam/systemeq
brew install --cask systemeq
```

Da Homebrew 6.0 i tap di terze parti devono essere resi attendibili in modo
esplicito, altrimenti l'installazione fallisce con `Refusing to load cask ...
from untrusted tap`. Il proprietario del tap non può farlo al posto tuo, quindi
è un comando da eseguire una volta per Mac. Su Homebrew 5 e precedenti il
comando non esiste: saltalo.

Il Cask rimuove automaticamente l'attributo di quarantena di macOS durante
l'installazione, così l'app si avvia senza alcun avviso di Gatekeeper
(SystemEQ è firmato ad-hoc, non notarizzato con un Apple Developer ID — la
motivazione è spiegata nel [README principale](https://github.com/denzam/SystemEQ-for-Mac/blob/main/README.it.md#installazione)).

## Aggiornamento

```bash
brew upgrade --cask systemeq
```

## Disinstallazione

```bash
brew uninstall --cask systemeq
```

La sezione `zap` del Cask pulisce anche Application Support, Preferences e Caches:

```bash
brew uninstall --cask --zap systemeq
```

## Requisiti

- macOS 13 (Ventura) o successivo
- Apple Silicon o Mac Intel
- [BlackHole 2ch](https://github.com/ExistentialAudio/BlackHole) (driver audio virtuale gratuito, installabile dal Setup Assistant integrato nell'app)

## Per i manutentori — aggiornare il cask dopo una nuova release

1. Aspetta che la GitHub Action di release pubblichi `SystemEQ-v<versione>.dmg`.
2. Calcola lo SHA-256 del DMG pubblicato:
   ```bash
   curl -sL https://github.com/denzam/SystemEQ-for-Mac/releases/download/v<versione>/SystemEQ-v<versione>.dmg | shasum -a 256
   ```
3. In `Casks/systemeq.rb` aggiorna `version` e sostituisci `sha256`.
4. Commit e push:
   ```bash
   git commit -am "Bump SystemEQ to v<versione>"
   git push
   ```
5. Verifica localmente:
   ```bash
   brew update
   brew info --cask denzam/systemeq/systemeq
   ```

## Licenza

La formula in questo repository è rilasciata sotto la stessa licenza di
SystemEQ for Mac — [GNU GPL v3](https://github.com/denzam/SystemEQ-for-Mac/blob/main/LICENSE).
