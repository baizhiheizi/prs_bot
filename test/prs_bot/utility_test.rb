# frozen_string_literal: true

require "test_helper"

module PrsBot
  class UtilityTest < Minitest::Test
    def test_recover_private_key
      keystore = '{"address":"758ea2601697fbd3ba6eb6774ed70b6c4cdb0ef9","crypto":{"cipher":"aes-128-ctr","ciphertext":"92af6f6710eba271eae5ac7fec72c70d9f49215e7880a0c45d4c53e56bd7ea59","cipherparams":{"iv":"13ddf95d970e924c97e4dcd29ba96520"},"mac":"b9d81d78f067334ee922fb2863e32c14cbc46e479eeb0acc11fb31e39256004e","kdf":"pbkdf2","kdfparams":{"c":262144,"dklen":32,"prf":"hmac-sha256","salt":"79f90bb603491573e40a79fe356b88d0c7869852e43c2bbaabed44578a82bbfa"}},"id":"93028e51-a2a4-4514-bc1a-94b089445f35","version":3}'
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
      hash, signature = PrsBot.utility.sign_hash hash, private_key
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

    def test_sign_text
      message = "hello"
      key_pair = PrsBot.utility.create_key_pair
      hash, signature = PrsBot.utility.sign_text message, key_pair[:private_key]
      assert_equal PrsBot.utility.private_key_to_address(key_pair[:private_key]), PrsBot.utility.sig_to_address(hash, signature)
    end
  end
end
