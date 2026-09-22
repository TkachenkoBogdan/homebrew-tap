cask "claude-spend-bar" do
  version "1.3.0"
  sha256 "78cd2442200aa9630331c07c821347d48b23aa701d664e0e783a4e8ab66d1a86"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/ClaudeSpendBar.zip"
  name "Claude Spend Bar"
  desc "Menu-bar readout of your claude.ai spend"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  depends_on macos: :sonoma

  app "Claude Spend Bar.app"

  # 1.3.0 renamed the bundle from ClaudeSpendBar.app. Without this, upgrading
  # from 1.2.0 or earlier fails: brew uninstalls the old version using the
  # *current* cask definition, goes looking for the new name, and stops.
  uninstall delete: "/Applications/ClaudeSpendBar.app"

  zap trash: "~/Library/Preferences/com.bt.claude-spend-bar.plist"

  caveats <<~EOS
    Claude Spend Bar lives in the menu bar — it has no Dock icon and no window.

    On first launch, click the mark in the menu bar and choose "Set session
    key…" to paste your claude.ai session key. It is stored in your login
    Keychain and sent only to claude.ai.
  EOS
end
