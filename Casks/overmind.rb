cask "overmind" do
  version "0.2.1"
  sha256 "dd4f08dbae8cefdfc4e6ab1d6dfb8266a7e71005916736ab2a50856654582dd3"

  url "https://github.com/tddworks/Overmind/releases/download/v#{version}/Overmind-#{version}.dmg"
  name "Overmind"
  desc "Menu bar app that watches a Cloudflare account's usage and bill"
  homepage "https://github.com/tddworks/Overmind"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Overmind.app"

  zap trash: [
    "~/.overmind",
    "~/Library/Caches/com.tddworks.overmind",
    "~/Library/HTTPStorages/com.tddworks.overmind",
    "~/Library/Preferences/com.tddworks.overmind.plist",
  ]
end
