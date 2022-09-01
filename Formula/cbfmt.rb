class Cbfmt < Formula
  desc "Tool to format codeblocks inside markdown and org documents"
  homepage "https://github.com/lukas-reineke/cbfmt"
  url "https://github.com/lukas-reineke/cbfmt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "42973e9b1e95f4f3d7e72ef17a41333dab1e04d3d91c7930aabfc08f72c14126"
  license "MIT"

  bottle do
    root_url "https://github.com/zegervdv/homebrew-tools/releases/download/cbfmt-0.1.1-1"
    sha256 cellar: :any_skip_relocation, big_sur:      "721d583e62640b411a9118ce54d318e088b2020aece818b5f39c1f181d5279da"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "646a18fe116267bfb9a82981137879ca4c534e88862e76b2a67d3cf107c89da3"
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
