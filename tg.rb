class Tg < Formula
  include Language::Python::Virtualenv

  desc "Terminal telegram client"
  homepage "https://github.com/paul-nameless/tg"
  url "https://github.com/paul-nameless/tg/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "216aec85b6224415a88e7b124a5fed3b310e4286171cb23a8d91f4c64a69d7dc"
  license "Unlicense"

  depends_on "python"
  depends_on "tdlib"

  resource "python-telegram-patched" do
    url "https://github.com/paul-nameless/python-telegram/archive/refs/tags/0.15.0-patched.tar.gz"
    sha256 "0602cf9d9dc2c932576104ee3d088a2299058583a2fcfb339b2aa8188eede0c3"
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
