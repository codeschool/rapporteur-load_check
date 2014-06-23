# Rapporteur Load Check

[![Gem Version](http://img.shields.io/gem/v/rapporteur-load_check.svg)](http://rubygems.org/gems/rapporteur-load_check)
[![Build Status](http://img.shields.io/travis/codeschool/rapporteur-load_check.png?branch=master)](https://travis-ci.org/codeschool/rapporteur-load_check)
[![Code Climate](http://img.shields.io/codeclimate/github/codeschool/rapporteur-load_check.svg)](https://codeclimate.com/github/codeschool/rapporteur-load_check)
[![Dependency Status](https://gemnasium.com/codeschool/rapporteur-load_check.svg)](https://gemnasium.com/codeschool/rapporteur-load_check)


Load checking for [Rapporteur](https://github.com/codeschool/rapporteur).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rapporteur-load_check'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install rapporteur-load_check
```

### Supported environments

Supported Ruby versions:

* MRI 2.0.0
* MRI 1.9.3
* MRI 1.9.2
* MRI 1.8.7

## Usage

To add the check to your application, define the check in your environment or
application configuration files or initializers, such as:

```ruby
# config/initializers/production.rb
Rapporteur.add_check(Rapporteur::Checks::LoadCheck)
```

And, if your server load is currently below the configured threshold, 0.54 for
this example, this library will add a `load` key and value to the success
response of Rapporteur (an HTTP 200 response):

```json
{
  "load": 0.54
}
```

If, however, your server load is too high - let's say 12.32 - then this library
will fail, cause Rapporteur to give a non-success response, and add a `load`
key and message to the error output of the Rapporteur (an HTTP 500 response):

```json
{
  "load": "above allowed threshold (12.32 > 8)"
}
```

### Configuration

By default, a load value of 8 or greater triggers a failure. You can adjust
this value by passing the threshold to LoadCheck.new, like so:

```ruby
Rapporteur.add_check(Rapporteur::Checks::LoadCheck.new(4))
```

The above would cause the checker to fail if load goes above 4.0.

### Localization

If you would like to localize the failure response, you may do so by adding a
`rapporteur.errors.load.excessive` definition to your local I18n locales. This
library will provide the `value` (current load value) and `tolerance`
(configured threshold) in case you would like to include those values in your
message.

For example:

```yaml
fr:
  rapporteur:
    errors:
      load:
        excessive: "est trop élevé (%{value})"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
