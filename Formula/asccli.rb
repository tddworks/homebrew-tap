# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.40"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.40/asc_v0.1.40_macOS_arm64"
    sha256 "ee34c645adb0a9e42f2065d18d7808d4b85641a851268b060e980a8e0085c782"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.40/asc_v0.1.40_macOS_x86_64"
    sha256 "7ca83cddcea771feedb9e377b01fcff380c0be74900675d4b8133f3b379601ed"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.40_macOS_arm64" : "asc_v0.1.40_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
