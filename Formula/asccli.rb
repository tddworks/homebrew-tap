# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.62"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.62/asc_v0.1.62_macOS_arm64"
    sha256 "c10c8ef91c2d0328554febef175aef68f9813d9f22ceae6aab593c7e3ef0cf92"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.62/asc_v0.1.62_macOS_x86_64"
    sha256 "c862750b9b5e9e5350509084e80f37ef545874e63c8620eececc681900c94b3a"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.62_macOS_arm64" : "asc_v0.1.62_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
