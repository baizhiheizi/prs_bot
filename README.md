> !!!Notice: **Not Finished Yet**
>
> !!注意: **未完成**

# PrsBot

An Unofficial SDK of [PressOne](https://press.one) in Ruby.

## Install

Add this line to your application's Gemfile:

```
gem 'prs_bot', github: 'an-lee/prs_bot'
```

And then execute:

```
$ bundle
```

## Requirements

For now, PrsBot use Javascript libs [elliptic](https://github.com/indutny/elliptic) and [keythereum](https://github.com/ethereumjs/keythereum) for the main algorithm. So some node_modules are required.

- nodejs
- [elliptic](https://github.com/indutny/elliptic)
- [keythereum](https://github.com/ethereumjs/keythereum)

Your may install the dependencies in your project. Just add a `package.json` in your project, like

```
{
  "name": "prs_bot",
  "dependencies": {
    "keythereum": "^1.0.2",
    "elliptic": "^6.4.0"
  }
}
```

then run

```
$ npm install
```

## Usage

### API

Config your PrsBot first:

```
PrsBot.keystore = 'your keystore'
PrsBot.password = 'your password'
PrsBot.dependencies_path = 'your dependencies(node_modules) path'
```

If you are in a rails project, you may put your `keystore` & `password` in the `application.yml`, and config in the `config/initializers/prs_bot.rb`, like

```
PrsBot.keystore = Figaro.env.PRS_KEYSTORE
PrsBot.password = Figaro.env.PRS_PASSWORD
PrsBot.dependencies_path = Rails.root
```

Then, you can use the PrsBot APIs, such as:

```
PrsBot.api.get_user_profile(address)
```

## Reference

- [PRESS.one-SDK](https://github.com/Press-One/Third-Party-APP-SDK)

## License

This project rocks and uses MIT-LICENSE.
