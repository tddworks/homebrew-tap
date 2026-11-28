# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.19.2"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.19.2/asc_v0.19.2_macOS_arm64"
    sha256 "71364ddcf0dda371394052dc6549f337c0a63cc8120a2be7c4aa3fa799387c4a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.19.2/asc_v0.19.2_macOS_x86_64"
    sha256 "b6aff27c6824d5acb15cafc7f2dfca87c0e807e53c972c45c45daa361cbc2e88"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.19.2_macOS_arm64" : "asc_v0.19.2_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
