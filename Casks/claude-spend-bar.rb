cask "claude-spend-bar" do
  version "2.0.3"
  sha256 "7284f6ca7c5fe12eff6d3707b051505082074e775d69963a9af1fdcfa1a105bb"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/ClaudeSpendBar.zip"
  name "Claude Spend Bar"
  desc "Menu-bar readout of your claude.ai spend"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  # The app updates itself with Sparkle from 1.5.0, so brew leaves an
  # installed copy alone on `brew upgrade` rather than reinstalling it.
  # Renamed: new installs use the norn cask. This one stays loadable so
  # existing installs can still be upgraded and uninstalled.
  deprecate! date: "2026-10-29", because: "is now Norn", replacement_cask: "norn"

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
