# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.3"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.3/asc_v0.1.3_macOS_arm64"
    sha256 "d2684a31251557b3a3b6f1e87640d0ce75f3454c281e0449ddf74ffbf0e7bdb3"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.3/asc_v0.1.3_macOS_x86_64"
    sha256 "967bb932b7b12e9b687c3c0683afd273259c6b115f50cefe8a028cc36d996233"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.3_macOS_arm64" : "asc_v0.1.3_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
