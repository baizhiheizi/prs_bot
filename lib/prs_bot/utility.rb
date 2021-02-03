# frozen_string_literal: true

require "eth"

module PrsBot
  # PRS crypto tools
  class Utility
    def recover_private_key(keystore, password)
      Eth::Key::Decrypter.perform keystore, password
    end

    def private_key_to_address(priv)
      key = Eth::Key.new(priv: priv)
      Eth::Utils.remove_hex_prefix(key.address).downcase
    end

    def create_key_pair
      key = Eth::Key.new
      {
        private_key: key.private_hex,
        public_key: key.public_hex,
        address: Eth::Utils.remove_hex_prefix(key.address).downcase
      }
    end

    def sign_hash(hash, private_key)
      key = Eth::Key.new(priv: private_key)
      hash_bin = Eth::Utils.hex_to_bin hash
      signature_bin = key.sign_hash hash_bin
      v, r, s = Eth::Utils.v_r_s_for signature_bin
      v -= 27
      v = v.to_s(16)
      v = "0#{v}" if (v.size % 2).positive?
      signature = r.to_s(16) + s.to_s(16) + v
      [hash, signature]
    end

    def sig_to_address(hash, signature)
      hash_bin = Eth::Utils.hex_to_bin hash
      signature_bin = Eth::Utils.hex_to_bin(signature).bytes.rotate(-1).pack("c*")
      public_hex = Eth::OpenSsl.recover_compact hash_bin, signature_bin
      address = Eth::Utils.public_key_to_address public_hex
      Eth::Utils.remove_hex_prefix(address).downcase
    end

    def keccak256(message)
      Eth::Utils.bin_to_hex Eth::Utils.keccak256(message)
    end

    def sign_text(message, private_key, alg: "keccak256")
      hash = keccak256 message
      sign_hash hash, private_key
    end
  end
end
