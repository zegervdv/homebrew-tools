class BeancountLanguageServer < Formula
  desc "Language Server Protocol (LSP) for beancount files"
  homepage "https://github.com/polarmutex/beancount-language-server"
  url "https://github.com/polarmutex/beancount-language-server/archive/refs/tags/v1.2.5.tar.gz"
  sha256 "230ee5ea9f8e1f0964faf88581dde5f027e54ec93d0d696cee6425c4388ffe76"
  license "MIT"

  bottle do
    root_url "https://github.com/zegervdv/homebrew-tools/releases/download/beancount-language-server-1.2.5"
    sha256 cellar: :any_skip_relocation, big_sur:      "af735c4d3a72701db154986514232a7b367a16a50480e488a0c35bdb0c2e0ade"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "810c3280da534b2d7c98cedbb62f194c3155e60de5a3a090e8e55eb971da8910"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "beancount-language-server", "--help"
  end
end
