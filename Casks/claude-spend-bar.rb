cask "claude-spend-bar" do
  version "1.4.3"
  sha256 "951771e7834c322223b4d0e177726efa8cbbcbaca658edff83dd54361ca8a04d"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/ClaudeSpendBar.zip"
  name "Claude Spend Bar"
  desc "Menu-bar readout of your claude.ai spend"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  depends_on macos: :sonoma

  app "Claude Spend Bar.app"

  # 1.3.0 renamed the bundle from ClaudeSpendBar.app. Cleaning that up from the
  # uninstall stanza made brew shell out to `sudo rm` on *every* upgrade, asking
  # each user for their password, so anyone coming from 1.2.0 or earlier removes
  # the stale bundle themselves — or just reinstalls.
  zap trash: [
    "~/Library/Preferences/com.bt.claude-spend-bar.plist",
    "/Applications/ClaudeSpendBar.app",
  ]

  caveats <<~EOS
    Claude Spend Bar lives in the menu bar — it has no Dock icon and no window,
    and brew does not start it. Launch it once:

      open -a "Claude Spend Bar"

    A clay triangle appears at the top right of your screen. Click it and choose
    "Set session key…" to paste your claude.ai session key; it is stored in your
    login Keychain and sent only to claude.ai.

    It adds itself to your login items on that first run, so it is there after a
    restart. Turn that off in its settings if you would rather it did not.
  EOS
end
