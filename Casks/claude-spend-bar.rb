cask "claude-spend-bar" do
  version "1.2.0"
  sha256 "c91ff4997cbb8db349cbd9c5e1e95286fa0fca2e273da3f1a996dd92abbfccef"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/ClaudeSpendBar.zip"
  name "ClaudeSpendBar"
  desc "Menu-bar readout of your claude.ai spend"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  depends_on macos: :sonoma

  app "ClaudeSpendBar.app"

  zap trash: "~/Library/Preferences/com.bt.claude-spend-bar.plist"

  caveats <<~EOS
    ClaudeSpendBar lives in the menu bar — it has no Dock icon and no window.

    On first launch, click the mark in the menu bar and choose "Set session
    key…" to paste your claude.ai session key. It is stored in your login
    Keychain and sent only to claude.ai.
  EOS
end
