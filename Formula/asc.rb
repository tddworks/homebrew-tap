# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "main"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/main/asc_main_macOS_arm64"
    sha256 "be6971abb97f254bef491cb81442411c81b8dfacceaeb4d0c6f4684fc022e4ef"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/main/asc_main_macOS_x86_64"
    sha256 "f78e27530c4183ec9642f195e88cd851afc78b03f2a419fafa80f7397daf6ed7"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_main_macOS_arm64" : "asc_main_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
