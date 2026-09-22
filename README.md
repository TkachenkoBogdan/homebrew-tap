# homebrew-tap

Homebrew tap for my macOS tools.

## ClaudeSpendBar

A menu-bar readout of your claude.ai spend.

**Not a developer?** There is a download page with a disk image and
step-by-step setup: <https://tkachenkobogdan.github.io/homebrew-tap/>

With Homebrew:

```bash
brew install --cask tkachenkobogdan/tap/claude-spend-bar
```

Updates arrive with `brew upgrade`.

The app is signed with a Developer ID certificate and notarised by Apple, so it
launches without a Gatekeeper warning. It needs your claude.ai session key,
which you paste into the app on first run; the key is kept in your login
Keychain and is sent to claude.ai and nowhere else.

The application source lives in a separate private repository. This tap holds
only the cask and the released build.
