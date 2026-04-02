# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.63"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.63/asc_v0.1.63_macOS_arm64"
    sha256 "30f4ae82797bea8c1c664d156531ff4ffedb281a561aa9169785019704b53008"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.63/asc_v0.1.63_macOS_x86_64"
    sha256 "5515851b65b8550504b2ed180ee71b0f9c53dfa634e80d5af9f7ce18109e065b"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.63_macOS_arm64" : "asc_v0.1.63_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
