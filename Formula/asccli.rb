# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.57"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.57/asc_v0.1.57_macOS_arm64"
    sha256 "37e6c0e7e7f2618f2ded7d1afc90d6bbb37d8dc44a44fa0fe4e6c349b57fca5a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.57/asc_v0.1.57_macOS_x86_64"
    sha256 "fc63c66cb911523e95ef129d294624784f40fa79aaec17f74e8cbb454886650d"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.57_macOS_arm64" : "asc_v0.1.57_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
