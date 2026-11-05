# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.8"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.8/asc_v0.18.8_macOS_arm64"
    sha256 "99345b0f06a5f27cdecbabaf8608c2c7e4701db34c0793c972755f94112d73dc"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.8/asc_v0.18.8_macOS_x86_64"
    sha256 "1427972ed7b8f1c33a39a7b01fbb3c1964ed90ea11a2244530f173570c0e25d5"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.8_macOS_arm64" : "asc_v0.18.8_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
