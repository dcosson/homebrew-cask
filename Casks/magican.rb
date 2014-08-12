class Magican < Cask
  version 'latest'
  sha256 :no_check

  url 'http://www.magicansoft.com/download/Magican.pkg'
  homepage 'http://www.magicansoft.com/'

  install 'Magican.pkg'
  uninstall :pkgutil => 'com.magican.*'
end
