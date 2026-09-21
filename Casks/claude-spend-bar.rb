cask "claude-spend-bar" do
  version "1.1.0"
  sha256 "aeb661475f17dc925b33e18c9b58066f0004741fa3985579965d6fc8b3cb4f05"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/ClaudeSpendBar.zip"
  name "ClaudeSpendBar"
  desc "Menu-bar readout of your claude.ai spend"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  depends_on macos: :sonoma

  app "ClaudeSpendBar.app"

  zap trash: "~/Library/Preferences/com.bt.claude-spend-bar.plist"

  caveats <<~EOS
    ClaudeSpendBar lives in the menu bar — it has no Dock icon and no window.

    On first launch, open the gear menu and paste your claude.ai session key.
    It is stored in your login Keychain and sent only to claude.ai.
  EOS
end
