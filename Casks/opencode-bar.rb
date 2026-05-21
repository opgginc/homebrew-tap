cask "opencode-bar" do
  version "2.11.1"
  sha256 "5233de428dc385f35a43253f8687aef86a76ac245ad77e7f2bd92c85e1d80716"

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
