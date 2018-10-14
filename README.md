> !!!
>
> **Not Finished Yet**
>
> **未完成**

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

- nodejs

- [PRESS.one-SDK](https://github.com/Press-One/Third-Party-APP-SDK)

Install dependencies in your project

```
npm install git://git@github.com:Press-One/Third-Party-APP-SDK.git
```

## Usage

### API

Config your PrsBot first:

```
PrsBot.keystore = 'your keystore'
PrsBot.password = 'your password'
```

If you are in a rails project, you may put your `keystore` & `password` in the `application.yml`, and config in the `config/initializers/prs_bot.rb`, like

```
PrsBot.keystore = Figaro.env.PRS_KEYSTORE
PrsBot.password = Figaro.env.PRS_PASSWORD
```

Then, you can use the PrsBot APIs, such as:

```
PrsBot.api.get_user_profile(address)
```

## Reference

- [PRESS.one-SDK](https://github.com/Press-One/Third-Party-APP-SDK)

## License

This project rocks and uses MIT-LICENSE.
