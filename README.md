# Rapporteur Load Check

Load checking for [Rapporteur](https://github.com/codeschool/rapporteur).

## Installation

Add this line to your application's Gemfile:

    gem 'rapporteur-load_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rapporteur-load_check

## Usage

To add the check to your application, define the check in your environment or
application configuration files or initializers, such as:

```ruby
# config/initializers/production.rb
Rapporteur::Checker.add_check(Rapporteur::Checks::LoadCheck)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
