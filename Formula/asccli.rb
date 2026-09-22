# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.3"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.3/asc_v0.18.3_macOS_arm64"
    sha256 "6adc0a2f9311056b24fd9c53f9dde7fa072c4f2c591bd02245e67f9fd80e978a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.3/asc_v0.18.3_macOS_x86_64"
    sha256 "9fb46a1ad1bae75c3fd2a2e665b3a01170666e276d4d7900312358d2ef7255fc"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.3_macOS_arm64" : "asc_v0.18.3_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
