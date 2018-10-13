module PrsBot
  class Auth
    attr_reader :client

    def initialize(options={})
      @client = Client.new
    end

    def get_auth_header(path=nil, payload={}, options={})
      options = options.with_indifferent_access

      keystore = options['keystore'] || PrsBot.keystore
      password = options['password'] || PrsBot.password

      address = JSON.parse(keystore)['address']
      message = roll_object({ 'path': path, 'payload': payload }).to_json
      sig_obj = sign message, keystore, password
      sig = sig_obj[:sig]
      msghash = res[:msghash]
      {
        'Content-Type':     'application/json',
        'X-Po-Auth-Address': address,
        'X-Po-Auth-Sig':     sig,
        'X-Po-Auth-Msghash': msghash,
      }
    end

    def sign(message, keystore, password)
      key = Eth::Key.decrypt keystore, password
      msghash = keccak256 message

      res = Eth::Utils.v_r_s_for(key.sign msghash)
      combinedHex = res[1].to_s(16) + sig[2].to_s(16) + (res[0] - 27).to_s

      { sig: combinedHex, msghash: msghash }
    end

    def sign_file(content, options={})
      #code
    end

    def sign_file_viaKey(content, options={})
      #code
    end

    def sign_image(file, options={})
      #code
    end

    def sign_text(text, options={})
      #code
    end

    def get_auth_signature(path, payload, options={})
      #code
    end

    def roll_object(object)
      if object.class == Hash
        result = []
        object.each do |key, value|
          value = roll_object(value)
          hash = {}
          hash[key] = value
          result << hash
        end
      else
        result = object
      end

      result
    end

    def get_pub_address_by_sig_and_msghash(sig, msghash, options={})
      #code
    end

    def keccak256(message)
      msg_hex = Eth::Utils.keccak256 message
      return Eth::Utils.bin_to_hex msg_hex
    end

    def sha256(string)
      #code
    end

    def create_key_pair(options={})
      #code
    end
  end
end
