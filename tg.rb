class Tg < Formula
  include Language::Python::Virtualenv

  desc "Terminal telegram client"
  homepage "https://github.com/paul-nameless/tg"
  url "https://github.com/paul-nameless/tg/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "9a065b384f47fe4551f65461c570d5c158f3620fd57b33f6da0840dea0996a80"
  license "Unlicense"

  depends_on "python@3.9"
  depends_on "tdlib"

  resource "python-telegram-patched" do
    url "https://github.com/paul-nameless/python-telegram/archive/refs/tags/0.14.0-patched.tar.gz"
    sha256 "7f3af4cb722f37bd65b0a49da448b7d26afa7f2de761aed4828018155e2e78b4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    require "pty"

    PTY.spawn(bin/"tg") do |r, w, _pid|
      assert_match "Enter your phone", r.gets
      w.close
      r.close
    end
  end
end
