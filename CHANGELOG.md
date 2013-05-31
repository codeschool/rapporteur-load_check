# Rapporteur Load Check changelog

## [HEAD][unreleased] / unreleased

* Add missing English locales.
* Change the I18n key for an excessive load failure to
  "rapporteur.errors.load.excessive".
* Add a halt! when the load is high. Because we don't want to overburden an
  already dying machine.

## [1.1.0][v1.1.0] / 2013-05-30

* Allow adjustment of load failure threshold.

## 1.0.0 / 2013-05-30

* Initial public release.

[unreleased]: https://github.com/codeschool/rapporteur-load_check/compare/v1.1.0...master
[v1.1.0]: https://github.com/codeschool/rapporteur-load_check/compare/v1.0.0...v1.1.0
