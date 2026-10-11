cask "overmind" do
  version "0.2.2"
  sha256 "d9ddfda32c4a2153287d57550685a2e0ef9381729f64853c346492be61b63dbb"

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
