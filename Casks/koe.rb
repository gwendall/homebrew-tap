# The Homebrew cask, published to gwendall/homebrew-tap by the release
# workflow (.github/workflows/release.yml), which fills in the version and the
# zip's checksum.
cask "koe" do
  version "2.2.13"
  sha256 "c4570b5f194a18ffe7169422ae8f0775a244bd6ce1df2617f545e82df3b0443a"

  url "https://files.koe.fm/v#{version}/Koe.zip"
  name "Koe"
  desc "Hold a key, talk, and the words land where you type, offline"
  homepage "https://koe.fm/"

  # /latest is one line, the newest version.
  livecheck do
    url "https://files.koe.fm/latest"
    regex(/^v?(\d+(?:\.\d+)+)$/)
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
