# The Homebrew cask, published to gwendall/homebrew-tap by the release
# workflow (.github/workflows/release.yml), which fills in the version and the
# zip's checksum.
cask "koe" do
  version "2.2.5"
  sha256 "edf5a6f402cebcc94b537ed94d719b85849233081908445d30395acb8d209d91"

  url "https://github.com/gwendall/koe-mac/releases/download/v#{version}/Koe.zip"
  name "Koe"
  desc "Hold a key, talk, and the words land where you type, offline"
  homepage "https://koe.fm/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Koe updates itself (Update Automatically in its settings).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Koe.app"

  uninstall quit: "fm.koe.mac"

  zap trash: [
    "~/Library/Application Support/Koe",
    "~/Library/Preferences/fm.koe.mac.plist",
  ]

  caveats <<~EOS
    Open Koe (in Applications): it asks for the microphone and Accessibility,
    and gets its voice model (630 MB, once). Then hold fn, talk, and let go.
  EOS
end
