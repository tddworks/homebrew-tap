# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.0"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.0/asc_v0.17.0_macOS_arm64"
    sha256 "0eb9cd89e40e25a5879ed33e2618315510fcbf893da6372c9ef37d738d538164"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.0/asc_v0.17.0_macOS_x86_64"
    sha256 "c2a93bd5bd6053ea2198ea4318379161ba6bb39a4ca54599b4dfa8066ec70590"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.0_macOS_arm64" : "asc_v0.17.0_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
