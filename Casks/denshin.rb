# The Homebrew cask, published to gwendall/homebrew-tap (beside Kiku's, Koe's
# and Wham's) by the `cask` job of .github/workflows/release-accounts.yml,
# which fills in the version and the zip's checksum once `latest` names it:
#
#   brew install --cask gwendall/tap/denshin
cask "denshin" do
  version "0.0.24"
  sha256 "830977d4ee8c03d114226c04c8d4fef2b6e9de35bafde43da7fdee2eecdcdab0"

  url "https://files.denshin.dev/v#{version}/Denshin.zip"
  name "Denshin"
  desc "Your agent sessions and accounts together, in one app"
  homepage "https://denshin.dev/"

  # /latest is one line, the newest version, written last by each release.
  livecheck do
    url "https://files.denshin.dev/latest"
    regex(/^v?(\d+(?:\.\d+)+)$/)
  end

  # Denshin updates itself (automatic updates are on unless turned off in Settings).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Denshin.app"

  uninstall quit: "run.denshin.accounts"

  zap trash: [
    "~/Library/Caches/run.denshin.accounts",
    "~/Library/HTTPStorages/run.denshin.accounts",
    "~/Library/Preferences/run.denshin.accounts.plist",
    "~/Library/Saved Application State/run.denshin.accounts.savedState",
    "~/Library/WebKit/run.denshin.accounts",
  ]

  caveats <<~EOS
    Open Denshin from Applications: it lives in your menu bar, and its welcome
    screens say what your Mac still needs. The service it starts and your
    accounts live in ~/.denshin, outside the app, and stay there when the app
    is removed.
  EOS
end
