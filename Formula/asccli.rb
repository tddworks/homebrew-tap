# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.16.9"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.16.9/asc_v0.16.9_macOS_arm64"
    sha256 "10685451fa1db31f4e14b310bd17716dd5b5050a2cab79b0bdb9f0cadc48f0d6"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.16.9/asc_v0.16.9_macOS_x86_64"
    sha256 "9b4d3c49bc56db7717b77c7e20faf687b9f2af3edce489a73a5c94ea097d3ee7"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.16.9_macOS_arm64" : "asc_v0.16.9_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
