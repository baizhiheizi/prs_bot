module PrsBot
  class UtilitySchmoozer < Schmooze::Base
    dependencies utility: './utility'

    method :getAuthHeader, 'utility.getAuthHeader'
    method :signFile, 'utility.signFile'
    method :signFileViaKey, 'utility.signFileViaKey'
    method :signImage, 'utility.signImage'
    method :signText, 'utility.signText'
    method :rollObject, 'utility.rollObject'
    method :getPubaddressBySigAndMsghash, 'utility.getPubaddressBySigAndMsghash'
    method :keccak256, 'utility.keccak256'
    method :sha256, 'utility.sha256'
    method :randomString, 'utility.randomString'
    method :createKeyPair, 'utility.createKeyPair'
  end
end
