# gwendall/tap

Homebrew casks for Kiku, Koe and Wham.

| App | What it does | Install | Needs |
| --- | --- | --- | --- |
| [Kiku](https://kiku.sh) | Your calls, taken down. | `brew install --cask gwendall/tap/kiku` | Apple silicon, macOS 14.4 or later |
| [Koe](https://koe.fm) | Talk. It types. | `brew install --cask gwendall/tap/koe` | Apple silicon, macOS 14 or later |
| [Wham](https://wham.sh) | Close the lid. Your Mac stays awake. | `brew install --cask gwendall/tap/wham` | Apple silicon or Intel, macOS 11 or later |

Write the full name, `gwendall/tap/koe`: plain `koe` is another app in Homebrew's main repository.

Each app updates itself. To remove one with its settings and data:

```sh
brew uninstall --zap --cask gwendall/tap/kiku
```

Made by [Gwendall](https://gwendall.com).
