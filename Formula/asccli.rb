# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.0"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.0/asc_v0.18.0_macOS_arm64"
    sha256 "f6af27e05f575bfefcbfde3b13d3d7f139ff0702e6b7b84c55f2188dce3764a8"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.0/asc_v0.18.0_macOS_x86_64"
    sha256 "f1ca344ed0619ec2717126318568c0e0bca78ecb06128d7ad5dc39800828cd48"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.0_macOS_arm64" : "asc_v0.18.0_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
