# frozen_string_literal: true

require "test_helper"

module PrsBot
  class UtilityTest < Minitest::Test
    def test_recover_private_key
      keystore = File.read("./test/fixtures/keystore.json")
      password = "123123"
      private_key = PrsBot.utility.recover_private_key(keystore, password)
      assert_equal private_key, "6e204c62726a19fe3f43c4ca9739b7ffa37e4a3226f824f3e24e00a5890addc6"
    end

    def test_private_key_to_address
      private_key = "6e204c62726a19fe3f43c4ca9739b7ffa37e4a3226f824f3e24e00a5890addc6"
      address = PrsBot.utility.private_key_to_address private_key
      assert_equal address, "758ea2601697fbd3ba6eb6774ed70b6c4cdb0ef9"
    end

    def test_keccak256
      message = "hello prs"
      hash = PrsBot.utility.keccak256 message
      assert_equal hash, "647df39ad889e83cc0b9b65375672d1bfe282565c564d3d553a435bf80e67d92"
    end

    def test_create_key_pair
      key_pair = PrsBot.utility.create_key_pair
      refute_nil key_pair[:private_key]
      refute_nil key_pair[:public_key]
      refute_nil key_pair[:address]
    end

    def test_sign_hash
      hash = "a70b44e0a41bc225914180dc0785fd71f8f018d90e76e3c5687e027ad273b695"
      private_key = "6e204c62726a19fe3f43c4ca9739b7ffa37e4a3226f824f3e24e00a5890addc6"
      signature = PrsBot.utility.sign_hash hash, private_key
      addr_by_private_key = PrsBot.utility.private_key_to_address private_key
      addr_by_sig = PrsBot.utility.sig_to_address hash, signature
      assert_equal addr_by_private_key, addr_by_sig
    end

    def test_sig_to_address
      hash = "a70b44e0a41bc225914180dc0785fd71f8f018d90e76e3c5687e027ad273b695"
      private_key = "6e204c62726a19fe3f43c4ca9739b7ffa37e4a3226f824f3e24e00a5890addc6"
      signature = "47e4f89120b4b50518ca5c1ffe6d4ff9a364053dbd832cc13afd286130be561f6a1f241605b58176716c3572822eab7f5e4fd20527da2854367bf57ab46a5eec01"

      addr_by_private_key = PrsBot.utility.private_key_to_address private_key
      addr_by_signature = PrsBot.utility.sig_to_address hash, signature
      assert_equal addr_by_private_key, addr_by_signature
    end

    def test_sign_text_in_keccak256
      message = "hello"
      key_pair = PrsBot.utility.create_key_pair
      alg = "keccak256"
      signature, hash = PrsBot.utility.sign_text message, key_pair[:private_key], alg: alg
      assert_equal PrsBot.utility.private_key_to_address(key_pair[:private_key]), PrsBot.utility.sig_to_address(hash, signature)
    end

    def test_sign_text_in_sha256
      message = "hello"
      key_pair = PrsBot.utility.create_key_pair
      alg = "sha256"
      signature, hash = PrsBot.utility.sign_text message, key_pair[:private_key], alg: alg
      assert_equal PrsBot.utility.private_key_to_address(key_pair[:private_key]), PrsBot.utility.sig_to_address(hash, signature)
    end

    def test_sign_block_data_keccak256
      data = { a: 111, b: 222 }
      key_pair = PrsBot.utility.create_key_pair
      alg = "keccak256"
      signature, hash = PrsBot.utility.sign_block_data data, key_pair[:private_key], alg: alg
      assert_equal PrsBot.utility.private_key_to_address(key_pair[:private_key]), PrsBot.utility.sig_to_address(hash, signature)
    end

    def test_sign_block_data_sha256
      data = { a: 111, b: 222 }
      key_pair = PrsBot.utility.create_key_pair
      alg = "sha256"
      signature, hash = PrsBot.utility.sign_block_data data, key_pair[:private_key], alg: alg
      assert_equal PrsBot.utility.private_key_to_address(key_pair[:private_key]), PrsBot.utility.sig_to_address(hash, signature)
    end
  end
end
