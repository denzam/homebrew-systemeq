cask "systemeq" do
  version "1.4.0"
  sha256 "2de9394728623c52fdc6e0eeaf14a5ffd9553919ea4fee9ed800d483b5f5634d"

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
