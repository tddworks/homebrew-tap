# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.19.0"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.19.0/asc_v0.19.0_macOS_arm64"
    sha256 "b920fd1bd6ac8af3908827bdd9a7e068f25d5c81234bbcac0c465b17a93bca3e"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.19.0/asc_v0.19.0_macOS_x86_64"
    sha256 "701e29285b3be8d4f1bd09854fccd2817946a40c414c70927e2a8026e2753b2a"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.19.0_macOS_arm64" : "asc_v0.19.0_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
