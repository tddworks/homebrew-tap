# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.42"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.42/asc_v0.1.42_macOS_arm64"
    sha256 "87cbcd938ef8d562c9bfcacd4f365f2ba951db429b1593e70b31cb3fc58ed46f"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.42/asc_v0.1.42_macOS_x86_64"
    sha256 "9cb1d30da7122160cd53769ac863897df53d4f45879d80f7a3347aa276396249"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.42_macOS_arm64" : "asc_v0.1.42_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
