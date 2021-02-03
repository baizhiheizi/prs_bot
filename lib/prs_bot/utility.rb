# frozen_string_literal: true

require "eth"
require "json"
require "digest"

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
      v = signature_bin[0].bytes[0]
      v -= 27 if v > 27
      v = v.to_s(16)
      v = "0#{v}" if (v.size % 2).positive?
      Eth::Utils.bin_to_hex(signature_bin[1..65]) + v
    end

    def sig_to_address(hash, signature)
      hash_bin = Eth::Utils.hex_to_bin hash
      signature_bin = Eth::Utils.hex_to_bin(signature).bytes.rotate(-1).pack("c*")
      public_hex = Eth::OpenSsl.recover_compact hash_bin, signature_bin
      raise "Failed to recover" unless public_hex

      address = Eth::Utils.public_key_to_address public_hex
      Eth::Utils.remove_hex_prefix(address).downcase
    end

    def keccak256(message)
      Eth::Utils.bin_to_hex Eth::Utils.keccak256(message)
    end

    def sha256(message)
      Digest::SHA256.hexdigest message
    end

    def sign_text(message, private_key, alg: "keccak256")
      hash =
        case alg
        when "keccak256"
          keccak256 message
        when "sha256"
          sha256 message
        else
          raise "#{alg} is not supported!"
        end

      [sign_hash(hash, private_key), hash]
    end

    def sign_block_data(data, private_key, alg: "keccak256")
      raise "Not a hash data" unless data.is_a? Hash

      hash =
        case alg
        when "keccak256"
          keccak256 sort_hash(data)
        when "sha256"
          sha256 sort_hash(data)
        else
          raise "#{alg} is not supported!"
        end

      [sign_hash(hash, private_key), hash]
    end

    def sort_hash(hash)
      keys = hash.keys.sort
      _hash = {}
      keys.each { |key| _hash[key] = hash[key] }

      _hash.to_json
    end
  end
end
