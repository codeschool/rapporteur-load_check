# Rapporteur Load Check

[![Gem Version](https://badge.fury.io/rb/rapporteur-load_check.png)](http://badge.fury.io/rb/rapporteur-load_check)
[![Build Status](https://travis-ci.org/codeschool/rapporteur-load_check.png?branch=master)](https://travis-ci.org/codeschool/rapporteur-load_check)
[![Code Climate](https://codeclimate.com/github/codeschool/rapporteur-load_check.png)](https://codeclimate.com/github/codeschool/rapporteur-load_check)

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
Rapporteur.add_check(Rapporteur::Checks::LoadCheck)
```

By default, a load value of 8 or greater triggers a failure. You can adjust
this value by passing the threshold to LoadCheck.new, like so:

```ruby
Rapporteur.add_check(Rapporteur::Checks::LoadCheck.new(4))
```

The above would cause the checker to fail if load goes above 4.0.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
