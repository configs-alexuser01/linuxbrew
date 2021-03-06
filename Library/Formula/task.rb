class Task < Formula
  homepage "http://www.taskwarrior.org/"
  url "http://taskwarrior.org/download/task-2.4.4.tar.gz"
  sha1 "e7e1336ed099f672b3d5971d6a221b72ed804ac6"
  head "https://git.tasktools.org/scm/tm/task.git", :branch => "2.4.5", :shallow => false

  bottle do
    sha256 "d88850d6183ecb96ce63d1a0601591262eb5675dfa786eba2d244f857dffa55e" => :yosemite
    sha256 "f160b9ff4cd55935c35a636257f8745acde5e8a45d9ece951173330ad98b4def" => :mavericks
    sha256 "aeae5194ecd2e3324d9bc925e5b9b8968063978a03a78d5c977da0fdba77d81c" => :mountain_lion
  end

  depends_on "cmake" => :build
  depends_on "gnutls" => :optional
  depends_on "libuuid" unless OS.mac?

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    bash_completion.install "scripts/bash/task.sh"
    zsh_completion.install "scripts/zsh/_task"
    fish_completion.install "scripts/fish/task.fish"
  end

  test do
    system "#{bin}/task", "--version"
  end
end
