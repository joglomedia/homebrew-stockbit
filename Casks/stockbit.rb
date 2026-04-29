cask "stockbit" do
  version "1.59.1"
  sha256 "8df746d70a198353ebbaa27ff1fb9e10c76af2c1817e6bb8161d144b22a9df71"

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
