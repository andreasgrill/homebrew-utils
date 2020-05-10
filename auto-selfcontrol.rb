class AutoSelfcontrol < Formula
  desc "Small utility to schedule start and stop times of SelfControl"
  homepage "https://github.com/andreasgrill/auto-selfcontrol"
  url "https://github.com/andreasgrill/auto-selfcontrol/archive/1.0.0.tar.gz"
  sha256 "8d049a617ad729255b9710be38eee5b41521b6eb70fbc633c71bcfd2f8b0a321"
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
