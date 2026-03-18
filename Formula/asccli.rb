# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.53"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.53/asc_v0.1.53_macOS_arm64"
    sha256 "b15185b7e57b29433796f67d3d6c1f4ff46dd991f52d35857eac18cf70ba0ea2"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.53/asc_v0.1.53_macOS_x86_64"
    sha256 "cef3e51842413d97a7907a7bf11d7a866ef3f42254d21d5af902dc39fe218ed3"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.53_macOS_arm64" : "asc_v0.1.53_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
