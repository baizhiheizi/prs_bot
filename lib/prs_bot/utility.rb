module PrsBot
  class Utility
    attr_reader :keystore, :password, :utility, :sdk_path

    def initialize(options={})
      options = options.with_indifferent_access

      @keystore = options['keystore'] || PrsBot.keystore
      @password = options['password'] || PrsBot.password
      @sdk_path = File.join(__dir__, 'sdk')
      @utility = UtilitySchmoozer.new @sdk_path
    end

    def setup
      `cd #{sdk_path} && npm i`
    end

    def get_auth_header(path=nil, payload={})
      payload = payload.with_indifferent_access

      utility.getAuthHeader path, payload, keystore, password
    end

    def sign_file(content)
      options = options.with_indifferent_access

      utility.signFile content, keystore, password
    end

    def sign_file_via_key(content, privatekey)
      utility.signFileViaKey content, privatekey
    end

    def sign_image(file, privatekey)
      utility.signImage file, privatekey
    end

    def sign_text(text)

      utility.signText text, keystore, password
    end

    def get_auth_signature(path, payload)
      payload = payload.with_indifferent_access

      utility.getAuthSignature path, payload, keystore, password
    end

    def roll_object(object)
      utility.rollObject object
    end

    def get_pub_address_by_sig_and_msghash(sig, msghash)
      utility.getPubaddressBySigAndMsghash sig, msghash
    end

    def keccak256(message)
      utility.keccak256 message
    end

    def sha256(string)
      utility.sha256 string
    end

    def random_string(count)
      utility.randomString count
    end

    def create_key_pair(options={})
      options = options.with_indifferent_access

      utility.createKeyPair(options)
    end
  end
end
