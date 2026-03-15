# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.50"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.50/asc_v0.1.50_macOS_arm64"
    sha256 "4b91497104928f083723299f0c753f78469f5c1d78ca35c97ad8d73504a241e5"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.50/asc_v0.1.50_macOS_x86_64"
    sha256 "c22e45a51a516c731abd8d2eb64aa094737c38a713b13121fa635b5a195f4190"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.50_macOS_arm64" : "asc_v0.1.50_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
