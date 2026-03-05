cask "opencode-bar" do
  version "2.7.9"
  sha256 "56d3925a23861d4eed87fe8ff04ca53a63740fd9d820c4cb6e68cab6738e31fc"

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
