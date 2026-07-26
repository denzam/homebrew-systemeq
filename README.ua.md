# Homebrew Cask для SystemEQ for Mac

> 🇺🇦 Українська | 🇬🇧 [English](README.md) | 🇮🇹 [Italiano](README.it.md)

Системний параметричний еквалайзер для macOS 13+ — [основний репозиторій](https://github.com/denzam/SystemEQ-for-Mac).

## Встановлення

```bash
brew tap denzam/systemeq
brew trust denzam/systemeq
brew install --cask systemeq
```

Починаючи з Homebrew 6.0, сторонні тапи треба явно позначити довіреними —
без `brew trust` встановлення падає з `Refusing to load cask ... from untrusted
tap`. Власник тапу зробити це за вас не може, тому команда виконується один раз
на кожному Mac. На Homebrew 5 і старіших такої команди немає — пропустіть її.

Cask автоматично знімає quarantine-атрибут macOS під час встановлення, тож
застосунок запускається без жодного попередження Gatekeeper (SystemEQ
ad-hoc підписаний, не нотаризований через Apple Developer ID — пояснення в
[основному README](https://github.com/denzam/SystemEQ-for-Mac/blob/main/README.ua.md#встановлення)).

## Оновлення

```bash
brew upgrade --cask systemeq
```

## Видалення

```bash
brew uninstall --cask systemeq
```

Секція `zap` у Cask також прибирає Application Support, Preferences та Caches:

```bash
brew uninstall --cask --zap systemeq
```

## Усунення несправностей

### `Error: Refusing to load cask ... from untrusted tap`

Homebrew 6.0 не завантажує сторонні тапи, поки ви не позначите їх довіреними, і
власник тапу зробити це за вас не може. Виконайте один раз на кожному Mac, а далі
встановлюйте чи оновлюйте як завжди:

```bash
brew trust denzam/systemeq
brew upgrade --cask systemeq   # або: brew install --cask systemeq
```

У Homebrew 5 і старіших команди `trust` не існує — пропустіть її.

### Після оновлення застосунок знову просить доступ до мікрофона

Так і має бути. SystemEQ підписаний ad-hoc, тому підпис змінюється при кожній
збірці і macOS вважає оновлення новим застосунком. Видайте дозвіл ще раз у
**Системних налаштуваннях → Конфіденційність і безпека → Мікрофон**.

## Вимоги

- macOS 13 (Ventura) або новіша
- Apple Silicon або Intel Mac
- [BlackHole 2ch](https://github.com/ExistentialAudio/BlackHole) (безкоштовний віртуальний аудіодрайвер, встановлюється через вбудований Setup Assistant)

## Для мейнтейнерів — оновлення cask після нового релізу

1. Дочекайся, поки GitHub Action релізу опублікує `SystemEQ-v<версія>.dmg`.
2. Порахуй SHA-256 опублікованого DMG:
   ```bash
   curl -sL https://github.com/denzam/SystemEQ-for-Mac/releases/download/v<версія>/SystemEQ-v<версія>.dmg | shasum -a 256
   ```
3. У `Casks/systemeq.rb` онови `version` і заміни `sha256`.
4. Commit і push:
   ```bash
   git commit -am "Bump SystemEQ to v<версія>"
   git push
   ```
5. Перевір локально:
   ```bash
   brew update
   brew info --cask denzam/systemeq/systemeq
   ```

## Ліцензія

Формула в цьому репозиторії випущена під тією ж ліцензією, що й сам
SystemEQ for Mac — [GNU GPL v3](https://github.com/denzam/SystemEQ-for-Mac/blob/main/LICENSE).
