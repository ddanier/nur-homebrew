class Nur < Formula
  desc "nur - a task runner based on nu shell"
  homepage "https://github.com/ddanier/nur"
  url "https://github.com/ddanier/nur/archive/refs/tags/v0.1.16.tar.gz"
  # Update with `http get --raw https://github.com/ddanier/nur/archive/refs/tags/vXXX.tar.gz | shasum -a 256`
  sha256 "97a0e019a0bdcb5746d0519a724a5022ef59a90032c4fdda06f6f94faa6c3ea5"
  license "MIT"
  head "https://github.com/ddanier/nur.git", branch: "main"

  livecheck do
    url :stable
    regex(/v?(\d+(?:[._]\d+)+)/i)
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  uses_from_macos "zlib"

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "libx11"
    depends_on "libxcb"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "0.1.16", pipe_output("#{bin}/nur --version", nil)
  end
end
