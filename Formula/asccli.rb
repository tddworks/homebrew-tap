# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.19.1"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.19.1/asc_v0.19.1_macOS_arm64"
    sha256 "7ab8de20292a680262c895398f1f9e260b0352c5ba9f89e5a291d1e5ddb8d7ba"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.19.1/asc_v0.19.1_macOS_x86_64"
    sha256 "2681b54e7cb5398ecbd5fe590edc40927b7c5ac3b5ae447f7cb2679cc0578884"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.19.1_macOS_arm64" : "asc_v0.19.1_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
