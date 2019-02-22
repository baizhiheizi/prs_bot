module PrsBot
  class Utility
    attr_reader :keystore, :password, :utility_schmoozer

    def initialize(dependencies_path='./node_modules')
      @utility = UtilitySchmoozer.new dependencies_path || PrsBot.dependencies_path
    end

    def get_pubaddress_by_sig_and_msghash
      @utility.getPubaddressBySigAndMsghash(sig, msghash)
    end
    
    def keccak256(message)
      @utility.keccak256(message)
    end
    
    def sha256(string)
      @utility.sha256(string)
    end
    
    def create_key_pair(options={})
      @utility.createKeyPair(string)
    end
    
    def hash_password(email, password)
      @utility.hashPassword(email, password)
    end
    
    def recover_private_key(keystore, password)
      @utility.recoverPrivateKey(keystore, password)
    end

    def get_auth_header(path=nil, payload={}, privateKey)
      @utility.getAuthHeader(path, payload, privateKey)
    end

    def sign_block_data(data, privateKey)
      @utility.signBlockData(data, privateKey)
    end

    def sign_to_pub_address(msghash, sig)
      @utility.signToPubAddress(msghash, sig)
    end
    
    def private_key_to_address(privateKey)
      @utility.privateKeyToAddress(privateKey)
    end
    
    def hash_by_file_reader(file, progressCallback)
      @utility.hashByFileReader(file, progressCallback)
    end

    def hash_by_readable_stream(stream)
      @utility.hashByReadableStream(stream)
    end
  end
end
