# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.52"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.52/asc_v0.1.52_macOS_arm64"
    sha256 "2b04d93578b4e84de0e8df0c5e9c69225e438e0cd27d81f9b641abc9b462bcf5"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.52/asc_v0.1.52_macOS_x86_64"
    sha256 "285961422e7408bb7aba63357c58b7e65e07b3e7db575bc253fb3fbd6a12bb47"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.52_macOS_arm64" : "asc_v0.1.52_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
