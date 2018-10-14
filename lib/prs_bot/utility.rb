module PrsBot
  class Utility
    attr_reader :keystore, :password, :utility_schmoozer

    def initialize(options={})
      options = options.with_indifferent_access

      @keystore = options['keystore'] || PrsBot.keystore
      @password = options['password'] || PrsBot.password
      @utility_schmoozer = UtilitySchmoozer.new options['dependencies_path'] || PrsBot.dependencies_path
    end

    def get_auth_header(path=nil, payload={})
      address = JSON.parse(keystore)['address']
      message = roll_object({ 'path': path, 'payload': payload }).to_json
      sig_obj = sign message
      sig = sig_obj[:sig]
      msghash = res[:msghash]
      {
        'Content-Type':     'application/json',
        'X-Po-Auth-Address': address,
        'X-Po-Auth-Sig':     sig,
        'X-Po-Auth-Msghash': msghash,
      }
    end

    def sign(message)
      msghash = keccak256 message

      signature = sign_by_schmoozer msghash
      combined_hex = signature["r"] + signature["s"] + signature["recoveryParam"]

      { sig: combined_hex, msghash: msghash }
    end

    def sign_file(content)
      # TODO:
    end

    def sign_file_via_key(content, privatekey)
      # TODO:
    end

    def sign_image(file, privatekey)
      # TODO:
    end

    def sign_text(text)
      sign text
    end

    def get_auth_signature(path, payload)
      # TODO:
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

    def get_pub_address_by_sig_and_msghash(sig, msghash)
      # TODO:
    end

    def keccak256(message)
      msg_hex = Eth::Utils.keccak256 message
      return Eth::Utils.bin_to_hex msg_hex
    end

    def sha256(string)
      # TODO:
    end

    def random_string(count)
      # TODO:
    end

    def create_key_pair(options={})
      # TODO:
    end

    def sign_by_schmoozer(msghash, options={})
      utility_schmoozer.sign(msghash, password, keystore)
    end
  end
end
