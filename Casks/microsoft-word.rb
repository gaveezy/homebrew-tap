cask "microsoft-word" do
  version "16.55.21111400"
  sha256 "e944da823e3ddaa1b5ec660db767b2b8c4db8f89ee2968c7da00faa089ad94c8"

  url "https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_#{version}_Installer.pkg",
      verified: "officecdnmac.microsoft.com/"
  name "Microsoft Word"
  desc "Word processor"
  homepage "https://products.office.com/en-US/word"

  livecheck do
    url "https://go.microsoft.com/fwlink/p/?linkid=525134"
    strategy :header_match
  end

  auto_updates false
  conflicts_with cask: "microsoft-office"
  depends_on macos: ">= :sierra"

  pkg "Microsoft_Word_#{version}_Installer.pkg"

  uninstall pkgutil:   [
    "com.microsoft.package.Microsoft_Word.app",
    "com.microsoft.pkg.licensing",
  ],

  zap trash: [
    "~/Library/Application Scripts/com.microsoft.Word",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.word.sfl*",
    "~/Library/Application Support/CrashReporter/Microsoft Word_*.plist",
    "~/Library/Containers/com.microsoft.Word",
    "~/Library/Preferences/com.microsoft.Word.plist",
  ]
end
