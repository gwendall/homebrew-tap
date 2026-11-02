# Kiku.dmg on files.kiku.sh is always the newest release, and Kiku updates
# itself: this cask needs no bump when Kiku ships. No `auto_updates`: with
# `version :latest` it is redundant (brew audit says so), `brew upgrade`
# leaves the app to its own updater either way.
cask "kiku" do
  version :latest
  sha256 :no_check

  url "https://files.kiku.sh/Kiku.dmg"
  name "Kiku"
  desc "Your calls, taken down, with no bot in the call and no server"
  homepage "https://kiku.sh/"

  depends_on arch: :arm64
  # Kiku needs macOS 14.4 (LSMinimumSystemVersion): Homebrew names major
  # versions only.
  depends_on macos: :sonoma

  app "Kiku.app"

  uninstall quit: "fm.kiku.mac"

  # Not ~/Library/Application Support/FluidAudio: that cache of voice models
  # is shared with other apps built on FluidAudio.
  zap trash: [
    "~/Library/Application Support/Kiku",
    "~/Library/Caches/fm.kiku.mac",
    "~/Library/HTTPStorages/fm.kiku.mac",
    "~/Library/Preferences/fm.kiku.mac.plist",
  ]
end
