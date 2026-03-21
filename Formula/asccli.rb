# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.56"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.56/asc_v0.1.56_macOS_arm64"
    sha256 "0cd85f18b7aea9a64df86966b275200ace56bce14c2e5da9d6694ae82cd5d432"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.56/asc_v0.1.56_macOS_x86_64"
    sha256 "3e92551f6427fdfff2e9d5e7e27581acff17534ae4bbc95f3ce94e1d14862ce0"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.56_macOS_arm64" : "asc_v0.1.56_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
