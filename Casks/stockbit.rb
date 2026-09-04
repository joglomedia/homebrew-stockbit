cask "stockbit" do
  version "2.2.0"
  sha256 "026dc5b525f4a30d90888d4cd584948e15f3c947eaf48ec49110864bb9be1b6d"

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
