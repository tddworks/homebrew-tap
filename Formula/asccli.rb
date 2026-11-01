# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.7"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.7/asc_v0.18.7_macOS_arm64"
    sha256 "11511653a3855e333ab13b1fb2cc074d1cb9e0895f9f9233df46cdece6e24d9b"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.7/asc_v0.18.7_macOS_x86_64"
    sha256 "6e7b441b7a7c388c68c767e79fffc7a5cd9df63aef717166964946d8bd0cc120"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.7_macOS_arm64" : "asc_v0.18.7_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
