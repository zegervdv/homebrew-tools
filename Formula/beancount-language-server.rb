class BeancountLanguageServer < Formula
  desc "Language Server Protocol (LSP) for beancount files"
  homepage "https://github.com/polarmutex/beancount-language-server"
  url "https://github.com/polarmutex/beancount-language-server/archive/refs/tags/v1.2.5.tar.gz"
  sha256 "230ee5ea9f8e1f0964faf88581dde5f027e54ec93d0d696cee6425c4388ffe76"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "beancount-language-server", "--help"
  end
end
