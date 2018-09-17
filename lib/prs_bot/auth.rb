module PrsBot
  class Auth
    attr_reader :client

    def initialize(options={})
      @client = Client.new
    end

    def get_auth_header(options={})
      #code
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
      #code
    end

    def get_pub_address_by_sig_and_msghash(sig, msghash, options={})
      #code
    end

    def keccak256(message)
      #code
    end

    def sha256(string)
      #code
    end

    def create_key_pair(options={})
      #code
    end
  end
end
