# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.46"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.46/asc_v0.1.46_macOS_arm64"
    sha256 "d376ed08975e5e403e592186b8755e4a6aa67a147c9a190f172bad5584ae9734"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.46/asc_v0.1.46_macOS_x86_64"
    sha256 "6ca8366e329eb5bcdbb033114f406385c2bbed7fadab1d2d908d8af248a5f2be"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.46_macOS_arm64" : "asc_v0.1.46_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
