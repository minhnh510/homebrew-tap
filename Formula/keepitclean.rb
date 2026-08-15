class Keepitclean < Formula
  desc "Safety-first macOS developer storage cleaner"
  homepage "https://github.com/minhnh510/keepitclean"
  url "https://github.com/minhnh510/keepitclean/releases/download/v0.1.0/keepitclean-v0.1.0-macos-universal.tar.gz"
  sha256 "4c0b90ffcc608000e5a8cabd0a65a420e99fe82ec46a55d0f17d2626b00d31fe"
  license "GPL-3.0-only"

  depends_on macos: :sonoma

  def install
    bin.install "bin/keep"
    libexec.install "libexec/com.minhnh510.keepitclean.helper"
    libexec.install "scripts/install-helper.sh"

    bash_completion.install "completions/keep.bash" => "keep"
    fish_completion.install "completions/keep.fish"
    zsh_completion.install "completions/_keep"

    pkgshare.install "CHANGELOG.md", "LICENSE", "LICENSES", "README.md",
                     "THIRD_PARTY_NOTICES.md", "UPSTREAM.md"
  end

  def caveats
    <<~EOS
      KeepItClean installs user-scoped, Trash-first cleanup without sudo.

      System Clean is optional and is not enabled during `brew install`.
      To install its fixed, allowlisted helper after reviewing the source, run:
        #{libexec}/install-helper.sh

      Release binaries are ad-hoc signed and not Apple-notarized in v0.1.0.
    EOS
  end

  test do
    assert_match "KeepItClean #{version}", shell_output("#{bin}/keep --version")
    assert_match "native-execution", shell_output("#{bin}/keep doctor --json")
    assert_match "keep", (zsh_completion/"_keep").read
  end
end
