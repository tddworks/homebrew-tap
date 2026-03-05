# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.36"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.36/asc_v0.1.36_macOS_arm64"
    sha256 "4ff45ea099c6ef80d64d04633c4d5fbb4d74041508b2ace9bb433ad9a2982f38"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.36/asc_v0.1.36_macOS_x86_64"
    sha256 "04b5f0163b7b4b29c7dcb43794776de6ed9e537a8f406305e99b8fb3d1007e8d"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.36_macOS_arm64" : "asc_v0.1.36_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
