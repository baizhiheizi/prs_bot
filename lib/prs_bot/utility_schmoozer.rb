module PrsBot
  class UtilitySchmoozer < Schmooze::Base
    dependencies utility: 'prs-sdk/utility'

    method :get_pubaddress_by_sig_and_msghash, 'utility'
    method :keccak256, 'utility.keccak256'
    method :sha256, 'utility.sha256'
    method :createKey_pair, 'utility.createKeyPair'
    method :hash_password, 'utility.hashPassword'
    method :recover_private_key, 'utility.recoverPrivateKey'
    method :get_auth_header, 'utility.getAuthHeader'
    method :sign_block_data, 'utility.signBlockData'
    method :sign_to_pub_address, 'utility.signToPubAddress'
    method :private_key_to_address, 'utility.privateKeyToAddress'
    method :hash_by_file_reader, 'utility.hashByFileReader'
    method :hash_by_readable_stream, 'utility.hashByReadableStream'
  end
end
