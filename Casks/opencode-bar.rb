cask "opencode-bar" do
  version "2.11.0"
  sha256 "f2b2e99041be54eedad8236a451df9efb26d6d041b42e2e55bf7c5555dc17c53"

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
