cask "systemeq" do
  version "1.4.7"
  sha256 "caae9c90ba81b918a00dbff971282fb9d76a1cef177a42bfb9b8e4e5b96c265e"

  url "https://github.com/denzam/SystemEQ-for-Mac/releases/download/v#{version}/SystemEQ-v#{version}.dmg"
  name "SystemEQ for Mac"
  desc "System-wide equalizer with AutoEQ support"
  homepage "https://github.com/denzam/SystemEQ-for-Mac"

  depends_on macos: :ventura

  app "SystemEQ for Mac.app"

  zap trash: [
    "~/Library/Application Support/SystemEQ",
    "~/Library/Caches/com.denzam.SystemEQ",
    "~/Library/Preferences/com.denzam.SystemEQ.plist",
  ]
end
