cask "stockbit" do
  version "1.45.1"
  sha256 "7bf543920329333f25a939030b00110f80b24a3114d4ffadbcf9b127e1cd048c"

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
  depends_on macos: ">= :monterey"

  app "Stockbit.app"

  zap trash: [
    "~/Library/Application Support/Stockbit",
    "~/Library/Saved Application State/com.stockbit.desktop.savedState",
  ]
end
