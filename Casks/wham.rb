# The Homebrew cask, published to gwendall/homebrew-tap by the release
# workflow (.github/workflows/release.yml), which fills in the version and the
# zip's checksum.
cask "wham" do
  version "1.7.0"
  sha256 "c60c9675b03b98059fc7ad3906114a64e57f08698945fe72dfbaaff2eb502f69"

  url "https://github.com/gwendall/wham/releases/download/v#{version}/Wham.zip"
  name "Wham"
  desc "One-click menu bar switch to stay awake, even with the lid closed"
  homepage "https://wham.sh/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Wham updates itself (Update Automatically in its menu).
  auto_updates true
  depends_on :macos

  app "Wham.app"
  binary "#{appdir}/Wham.app/Contents/MacOS/Wham", target: "wham"

  # Quitting Wham gives sleep back. On `brew upgrade` the new copy opens right
  # after and turns itself back on.
  uninstall quit: "sh.wham.app"

  zap delete: "/private/etc/sudoers.d/wham",
      trash:  [
        "~/Library/LaunchAgents/sh.wham.app.plist",
        "~/Library/Logs/Wham",
        "~/Library/Preferences/sh.wham.app.plist",
      ]

  caveats <<~EOS
    Open Wham (in Applications) and click its switch in the menu bar: your
    Mac stays awake, even with the lid closed. The first time, macOS asks for
    your password, once, to let Wham change that one setting.

    `brew uninstall --zap wham` also removes that permission
    (/private/etc/sudoers.d/wham).
  EOS
end
