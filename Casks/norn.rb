cask "norn" do
  version "3.1.1"
  sha256 "b615b3078e0fea965cd86b51e82a81e945effc0340e3419b5113b1b960ae0ea5"

  url "https://github.com/TkachenkoBogdan/homebrew-tap/releases/download/v#{version}/Norn.zip"
  name "Norn"
  desc "Menu-bar readout of your Claude usage"
  homepage "https://github.com/TkachenkoBogdan/homebrew-tap"

  # The app updates itself with Sparkle, so brew leaves an installed copy alone
  # on `brew upgrade` rather than reinstalling it.
  auto_updates true
  depends_on macos: :sonoma

  app "Norn.app"

  zap trash: ["~/Library/Preferences/com.bt.claude-spend-bar.plist"]

  caveats <<~EOS
    Norn lives in the menu bar: it has no Dock icon and no window, and brew does
    not start it. Launch it once:

      open -a Norn

    Click the ball in the menu bar and press Connect. Norn reads your usage
    through your own Claude Code; it never asks for a login.
  EOS
end
