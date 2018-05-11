class AppleGcc42 < Formula
  desc "GNU compiler collection"
  homepage "https://r.research.att.com/tools/"
  url "https://r.research.att.com/tools/gcc-42-5666.3-darwin11.pkg"
  mirror "https://web.archive.org/web/20130512150329/https://r.research.att.com/tools/gcc-42-5666.3-darwin11.pkg"
  version "4.2.1-5666.3"
  sha256 "2f3893b411f578bfa98a99646ecfea0ba14e1bff4e4f311d7e595936d0da065d"

  bottle do
    cellar :any_skip_relocation
    sha256 "07ff3dce62965fa6ba3ac63d5f3030d583ce070a1775cc11166ca9d32587ced5" => :el_capitan
    sha256 "bbd10e902c52e794035bf9773180a740300a826790da03a141d01e6cd6c5b87d" => :yosemite
    sha256 "4ccdc9fbf3900333bac114607eca9a8a5ea70ea9248d395798dd0d75dbf69c27" => :mavericks
  end

  option "with-gfortran-symlink", "Provide gfortran symlinks"

  depends_on :macos => :lion

  def install
    system "/bin/pax", "--insecure", "-rz", "-f", "usr.pkg/Payload", "-s", ",./usr,#{prefix},"

    if build.with? "gfortran-symlink"
      bin.install_symlink "gfortran-4.2" => "gfortran"
      man1.install_symlink "gfortran-4.2.1" => "gfortran.1"
    end
  end

  def caveats
    <<-EOS.undent
      NOTE:
      This formula provides components that were removed from XCode in the 4.2
      release. There is no reason to install this formula if you are using a
      version of XCode prior to 4.2.

      This formula contains compilers built from Apple's GCC sources, build
      5666.3, available from:

        https://opensource.apple.com/tarballs/gcc

      All compilers have a `-4.2` suffix. A GFortran compiler is also included.
    EOS
  end
end