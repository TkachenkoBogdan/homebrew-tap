cask "claude-spend-bar" do
  version "1.5.3"
  sha256 "f3fc02c3352a301894120149a48845b3b45551d930f50db2fed2184f44375c2e"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/ClaudeSpendBar.zip"
  name "Claude Spend Bar"
  desc "Menu-bar readout of your claude.ai spend"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  # The app updates itself with Sparkle from 1.5.0, so brew leaves an
  # installed copy alone on `brew upgrade` rather than reinstalling it.
  auto_updates true
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
