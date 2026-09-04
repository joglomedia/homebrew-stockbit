class CurlImpersonate < Formula
  desc "Impersonate version of curl"
  homepage "https://github.com/lwthiker/curl-impersonate"
  url "https://github.com/lwthiker/curl-impersonate/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "b89e055074d202aa457d2479a4b33f6a67e3e36a7bf4588755a9c97b3dd824ac"
  license "MIT"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "ninja" => :build

  depends_on "go" # for chrome only
  depends_on "libidn2"
  depends_on "rtmpdump"
  depends_on "zstd"

  def install
    inreplace "configure", %r{/usr/local}, prefix

    mkdir "build" do
      system "../configure"

      ENV.deparallelize do
        system "gmake", "chrome-build"
      end

      system "gmake", "chrome-checkbuild"

      system "gmake", "chrome-install"
    end
  end

  test do
    version = shell_output("#{bin}/curl-impersonate-chrome --version")

    # same as in chrome-checkbuild
    assert_match "libcurl", version
    assert_match "zlib", version
    assert_match "brotli", version
    assert_match "nghttp2", version
    assert_match "BoringSSL", version
  end
end
