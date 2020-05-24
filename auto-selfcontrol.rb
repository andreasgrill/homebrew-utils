class AutoSelfcontrol < Formula
  desc "Small utility to schedule start and stop times of SelfControl"
  homepage "https://github.com/andreasgrill/auto-selfcontrol"
  url "https://github.com/andreasgrill/auto-selfcontrol/archive/2.0.2.tar.gz"
  sha256 "67918f4df5d09c69566886b61db604396bbb79aa89ab82c12177d9302b12942a"
  head "https://github.com/andreasgrill/auto-selfcontrol.git"

  def install
    bin.install "auto-selfcontrol"
    bin.install "auto-selfcontrol.py"
    (etc/"auto-selfcontrol").install "config.json"
  end

  def caveats
    <<~EOS
      You need to have SelfControl installed. If it is not, run:
        brew cask install selfcontrol
    EOS
  end

  test do
    system "#{bin}/auto-selfcontrol", "help"
    system "#{bin}/auto-selfcontrol", "config"
    assert_predicate "#{etc}/auto-selfcontrol/config.json", :exist?
  end
end
