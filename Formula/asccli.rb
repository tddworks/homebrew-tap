# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.6"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.6/asc_v0.18.6_macOS_arm64"
    sha256 "b88e8de904b3b145383f0a4dd1c64f41c4dcc1edb3048ed9b017060926744370"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.6/asc_v0.18.6_macOS_x86_64"
    sha256 "f35e13bdd92dcab9eafa81644241b2065d1b609bf6f9ff18907bbb04af10e6e7"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.6_macOS_arm64" : "asc_v0.18.6_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
