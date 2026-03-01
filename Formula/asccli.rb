# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.29"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.29/asc_v0.1.29_macOS_arm64"
    sha256 "dfcfa4873565c31e4a571ea67633d646f91d85f37957d2a7306a93fb7e9680c9"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.29/asc_v0.1.29_macOS_x86_64"
    sha256 "589655d514b4dcea4f736772aa99984cefd06a0087639ebbac47927f7d33c5bc"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.29_macOS_arm64" : "asc_v0.1.29_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
