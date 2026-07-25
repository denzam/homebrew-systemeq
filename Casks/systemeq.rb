cask "systemeq" do
  version "1.1.1"
  sha256 "d0a085d538f4cd8108b907776eb6ec3ba6e620fab015e15b70082a3a70ac1e8e"

  url "https://github.com/denzam/SystemEQ-for-Mac/releases/download/v#{version}/SystemEQ-v#{version}.dmg"
  name "SystemEQ for Mac"
  desc "System-wide equalizer with AutoEQ support"
  homepage "https://github.com/denzam/SystemEQ-for-Mac"

  depends_on macos: :ventura

  app "SystemEQ for Mac.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SystemEQ for Mac.app"]
  end

  zap trash: [
    "~/Library/Application Support/SystemEQ",
    "~/Library/Caches/com.denzam.SystemEQ",
    "~/Library/Preferences/com.denzam.SystemEQ.plist",
  ]
end
