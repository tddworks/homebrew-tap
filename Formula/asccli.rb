# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.86"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.86/asc_v0.1.86_macOS_arm64"
    sha256 "4c6960de95578751777f6fb3a09e77a4d9a3ac197989141a4d9a1d5a7f5aa0a3"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.86/asc_v0.1.86_macOS_x86_64"
    sha256 "397e271cf7fd73dbcdbf79840fa938777ac36dfd0701af75b06df47104187896"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.86_macOS_arm64" : "asc_v0.1.86_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
