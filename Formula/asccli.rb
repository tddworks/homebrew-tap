# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.55"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.55/asc_v0.1.55_macOS_arm64"
    sha256 "bd127694b05f84f3b05f0af7136ca9de7da488db95a402053bb5d3c872dbef5a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.55/asc_v0.1.55_macOS_x86_64"
    sha256 "2c0576507176c4932701697dbb0fb2e766565149e1ac7b1f01017530864d9a94"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.55_macOS_arm64" : "asc_v0.1.55_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
