cask "systemeq" do
  version "1.0.5"
  sha256 "5f64f50cee79c57f5b656fa8296829e5f08304b419e028b07d37d0354797f1ef"

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
