# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.9"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.9/asc_v0.18.9_macOS_arm64"
    sha256 "03050208274b84a122f76815a653f25a5f794fec32a6fca8ab98409f1fbe08e2"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.9/asc_v0.18.9_macOS_x86_64"
    sha256 "74c6059a1ae5b770134e1af0d223a335667fe0268b3a056e4b7cbede42fe5182"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.9_macOS_arm64" : "asc_v0.18.9_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
