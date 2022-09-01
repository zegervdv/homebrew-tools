class Cbfmt < Formula
  desc "Tool to format codeblocks inside markdown and org documents"
  homepage "https://github.com/lukas-reineke/cbfmt"
  url "https://github.com/lukas-reineke/cbfmt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "42973e9b1e95f4f3d7e72ef17a41333dab1e04d3d91c7930aabfc08f72c14126"
  license "MIT"

  bottle do
    root_url "https://github.com/zegervdv/homebrew-tools/releases/download/cbfmt-0.2.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "46e1d2420ba0a1a0454a788c1b7d41487fe9227f9bec9d11348915d630c98a24"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0901e73dc1b835142c00b060cadab8d572fe1ca0894067701a673b0861ea8bd8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    testfile = testpath/"test.md"
    conffile = testpath/".cbfmt.toml"

    conffile.write <<-EOS
    [languages]
    lua = ["stylua -s -"]
    EOS

    testfile.write <<-EOS
    # test

    ```lua
    local test = {foo = {'bar', baz}}
    ```
    EOS
    system "cbfmt", "-w", testfile
  end
end
