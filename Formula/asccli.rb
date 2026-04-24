# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.1"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.1/asc_v0.17.1_macOS_arm64"
    sha256 "000c8508c7c335d550f6d5c890e733e289169753d9d655786e4f594660605547"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.1/asc_v0.17.1_macOS_x86_64"
    sha256 "1b1b111e39661f8b0fc003b3d0d491a6f587eb3233a6e4828a6b407536cd4ba3"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.1_macOS_arm64" : "asc_v0.17.1_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
