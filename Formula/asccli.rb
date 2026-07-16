# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.2"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.2/asc_v0.18.2_macOS_arm64"
    sha256 "7555b910823d8935d9dd5df5fe0382c0ab2741437ed26a3c5b683d13dd19530c"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.2/asc_v0.18.2_macOS_x86_64"
    sha256 "c72907829723e4ff3a7b60d4c1d9be8755995d4aab9cf960aaf866b83169456c"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.2_macOS_arm64" : "asc_v0.18.2_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
