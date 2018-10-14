module PrsBot
  class UtilitySchmoozer < Schmooze::Base
    dependencies elliptic: 'elliptic'
    dependencies keythereum: 'keythereum'

    method :sign, <<-JS
      function(msghash, password, _keystore) {
        const keystore   = JSON.parse(_keystore);
        const ec = require('elliptic').ec('secp256k1');
        const keythereum = require('keythereum');
        const privatekey = keythereum.recover(password, keystore)
        const existingPrivKey =  ec.keyFromPrivate(privatekey , 'hex')
        let res = existingPrivKey.sign(msghash);

        let signature = {
          r:             res.r.toString(16, 32),
          s:             res.s.toString(16, 32),
          recoveryParam: res.recoveryParam.toString()
        };

        return signature;
      }
    JS
  end
end
