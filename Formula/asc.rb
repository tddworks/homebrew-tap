# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  url "https://github.com/tddworks/asc-cli/releases/download/v0.1/asc_v0.1_macOS_universal"
  version "v0.1"
  sha256 "e673ce42ae97cce53da1be469f467284bebfc19df6f7a1d3ae9a166895528769"
  license "MIT"

  depends_on :macos

  def install
    bin.install "asc_v0.1_macOS_universal" => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
