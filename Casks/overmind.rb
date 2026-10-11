cask "overmind" do
  version "0.2.3"
  sha256 "66d93a88e55bd9b871ade175b4aa2fc9e28350c647fb87a3316ea4dac0e3772f"

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
