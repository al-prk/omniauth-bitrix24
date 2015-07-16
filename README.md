# Omniauth Bitrix24

This gem contains the [Bitrix24](https://www.bitrix24.ru/) strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-bitrix24'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-bitrix24


## Usage

Be sure to define callback URL in application version settings at [partner control panel](http://partners.1c-bitrix.ru/personal/b24marketplace/index.php), for example 'http://127.0.0.1:4567/auth/bitrix24/callback'.

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
      provider :bitrix24, 'https://myportal.bitrix24.ru', '<<<client_id>>>', '<<<client_secret>>>' 
  end
```

Also you can see dead-simple example in *example* directory


## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-bitrix24/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
