# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.48"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.48/asc_v0.1.48_macOS_arm64"
    sha256 "d47c8feb4d849ab43b9a4394f6d98d7f3b235e991371faa896146ea4764dbe26"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.48/asc_v0.1.48_macOS_x86_64"
    sha256 "17e78c56493022a2a03b3681682f160c52f0b0938072eae8762488858703042d"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.48_macOS_arm64" : "asc_v0.1.48_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
