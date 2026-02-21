cask "opencode-bar" do
  version "2.7.1"
  sha256 "94c0bad820be0333369c5bb28eb4e04dd1b83d381e0ce73b1b2b270f9dac516f"

  url "https://github.com/opgginc/opencode-bar/releases/download/v#{version}/OpenCodeUsageMonitor-v#{version}.dmg"
  name "OpenCode Bar"
  desc "Monitor AI provider usage from OpenCode in the macOS menu bar"
  homepage "https://github.com/opgginc/opencode-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "OpenCode Bar.app"
  binary "#{appdir}/OpenCode Bar.app/Contents/MacOS/opencodebar-cli", target: "opencodebar"

  zap trash: [
    "~/Library/Caches/com.copilotmonitor.CopilotMonitor",
    "~/Library/HTTPStorages/com.copilotmonitor.CopilotMonitor",
    "~/Library/Preferences/com.copilotmonitor.CopilotMonitor.plist",
    "~/Library/Saved Application State/com.copilotmonitor.CopilotMonitor.savedState",
  ]
end
