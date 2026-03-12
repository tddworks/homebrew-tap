# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.44"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.44/asc_v0.1.44_macOS_arm64"
    sha256 "9693916cb9c1eba2fc5d101a426af23c73acef5bc2e27ca1d05efee24a943994"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.44/asc_v0.1.44_macOS_x86_64"
    sha256 "fc408408f0d65ec7619d2f2eda5a9c56e167948637a2fbc95a582c3b91ac7afe"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.44_macOS_arm64" : "asc_v0.1.44_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
