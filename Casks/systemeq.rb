cask "systemeq" do
  version "1.0.6"
  sha256 "d0f10826363355d197b8205c0204ec66c40a921323093dcd7972f05878115a07"

  url "https://github.com/denzam/SystemEQ-for-Mac/releases/download/v#{version}/SystemEQ-v#{version}.dmg"
  name "SystemEQ for Mac"
  desc "System-wide equalizer for macOS with AutoEQ support"
  homepage "https://github.com/denzam/SystemEQ-for-Mac"

  depends_on macos: ">= :ventura"

  app "SystemEQ for Mac.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SystemEQ for Mac.app"]
  end

  zap trash: [
    "~/Library/Application Support/SystemEQ",
    "~/Library/Preferences/com.denzam.SystemEQ.plist",
    "~/Library/Caches/com.denzam.SystemEQ",
  ]
end
