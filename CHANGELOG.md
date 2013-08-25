# Rapporteur Load Check changelog

## [HEAD][unreleased] / unreleased

* No significant changes.

## [2.1.1][v2.1.1] / 2013-08-25

* Add explicit test and support for Ruby 2.0.
* Add Ruby 1.8 support (with Rapporteur 3+ and syntax fixes).

## [2.1.0][v2.1.0] / 2013-08-23

* Test and allow for Rapporteur 2.x and 3.x support.

## [2.0.0][v2.0.0] / 2013-05-31

* Add missing English locales.
* Add a halt! when the load is high. Because we don't want to overburden an
  already dying machine.

### :boom: Backward incompatible changes

* Change the I18n key for an excessive load failure to
  "rapporteur.errors.load.excessive".

## [1.1.0][v1.1.0] / 2013-05-30

* Allow adjustment of load failure threshold.

## 1.0.0 / 2013-05-30

* Initial public release.

[unreleased]: https://github.com/codeschool/rapporteur-load_check/compare/v2.1.1...master
[v2.1.1]: https://github.com/codeschool/rapporteur-load_check/compare/v2.1.0...v2.1.1
[v2.1.0]: https://github.com/codeschool/rapporteur-load_check/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/codeschool/rapporteur-load_check/compare/v1.1.0...v2.0.0
[v1.1.0]: https://github.com/codeschool/rapporteur-load_check/compare/v1.0.0...v1.1.0
