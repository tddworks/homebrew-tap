# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.39"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.39/asc_v0.1.39_macOS_arm64"
    sha256 "5ecb23a3ab413bf1053c4a15cefea2aadd7d9df133c0bf0377716b851c3f7d26"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.39/asc_v0.1.39_macOS_x86_64"
    sha256 "fa0376df11f7afde6173893f97ec7f8ad57106f6738c7b51b5eec74376df029e"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.39_macOS_arm64" : "asc_v0.1.39_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
