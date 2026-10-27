# The Homebrew cask, published to gwendall/homebrew-tap by the release
# workflow (.github/workflows/release.yml), which fills in the version and the
# zip's checksum.
cask "wham" do
  version "1.8.8"
  sha256 "706280c430b2210a1fa3fa8d463368e4eefe17a478fae6dbd444b364a2a6e397"

  url "https://files.wham.sh/v#{version}/Wham.zip"
  name "Wham"
  desc "One-click menu bar switch to stay awake, even with the lid closed"
  homepage "https://wham.sh/"

  # /latest is one line, the newest version.
  livecheck do
    url "https://files.wham.sh/latest"
    regex(/^v?(\d+(?:\.\d+)+)$/)
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
