cask "opencode-bar" do
  version "2.4.1"
  sha256 "30526df215ea48f5ef2823d59e6da16e986db3978b26913aa1087f711ae4816b"

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
