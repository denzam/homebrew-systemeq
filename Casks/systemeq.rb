cask "systemeq" do
  version "1.4.4"
  sha256 "838200e651ff020588a327483336d42d557d0209d0dba69d68eb84e2966da8e7"

  url "https://github.com/denzam/SystemEQ-for-Mac/releases/download/v#{version}/SystemEQ-v#{version}.dmg"
  name "SystemEQ for Mac"
  desc "System-wide equalizer with AutoEQ support"
  homepage "https://github.com/denzam/SystemEQ-for-Mac"

  depends_on macos: :ventura

  app "SystemEQ for Mac.app"

  postflight_steps do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SystemEQ for Mac.app"]
  end

  zap trash: [
    "~/Library/Application Support/SystemEQ",
    "~/Library/Caches/com.denzam.SystemEQ",
    "~/Library/Preferences/com.denzam.SystemEQ.plist",
  ]
end
