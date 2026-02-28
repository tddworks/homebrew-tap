# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.28"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.28/asc_v0.1.28_macOS_arm64"
    sha256 "1bd3e297b85b534fece75816716df3db1af2a7c0923513f3958e6aa87a46bf31"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.28/asc_v0.1.28_macOS_x86_64"
    sha256 "89106f69dbde4f7cf39800168f38217a25a05a90ffc205a656f793656fdd941c"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.28_macOS_arm64" : "asc_v0.1.28_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
