cask "stockbit" do
  version "1.68.0"
  sha256 "bf6cf90c33316b3b4d5468af7fb5133da9fa203eda542bff03abcfcbc1a7dc04"

  url "https://sda-release-v2.stockbit.com/release/#{version}/macos/Stockbit.dmg",
      verified: "sda-release-v2.stockbit.com/release/"
  name "Stockbit"
  desc "Stockbit adalah aplikasi untuk kamu yang ingin berdiskusi, analisa dan investasi saham dalam satu tempat."
  homepage "https://stockbit.com/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  auto_updates true

  app "Stockbit.app"

  zap trash: [
    "~/Library/Application Support/Stockbit",
    "~/Library/Saved Application State/com.stockbit.desktop.savedState",
  ]
end
