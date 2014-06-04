# Scrivito Resource Browser

[![Gem Version](https://badge.fury.io/rb/scrivito_resourcebrowser.png)](http://badge.fury.io/rb/scrivito_resourcebrowser)
[![Code Climate](https://codeclimate.com/github/infopark/scrivito_resourcebrowser.png)](https://codeclimate.com/github/infopark/scrivito_resourcebrowser)
[![Dependency Status](https://gemnasium.com/infopark/scrivito_resourcebrowser.png)](https://gemnasium.com/infopark/scrivito_resourcebrowser)
[![Build Status](https://travis-ci.org/infopark/scrivito_resourcebrowser.png)](https://travis-ci.org/infopark/scrivito_resourcebrowser)

The [Scrivito](http://scrivito.com) Resource Browser is a JavaScript based tool to add, update and
delete resources. It provides flexible configuration options and can easily be integrated into your
application.

## Installation and Usage

If you already use the gem [scrivito_editors](https://github.com/infopark/scrivito_editors) then you
don't have to change anything, because it is a dependency that will be installed automatically.

If you want to use this gem separately, please add it to your `Gemfile`.

    gem 'scrivito_resourcebrowser'

Then require it in your stylesheet manifest.

    *= require scrivito_resourcebrowser

And require it in your JavaScript manifest.

    //= require scrivito_resourcebrowser


## Changelog

See [Changelog](https://github.com/infopark/scrivito_resourcebrowser/blob/master/CHANGELOG.md) for more
details.


## Contributing

We would be very happy and thankful if you open new issues in order to further improve Scrivito
Resource Browser. If you want to go a step further and extend the functionality or fix a problem,
you can do so any time by following the steps below.

1. Fork and clone the
   [Scrivito Resource Browser GitHub repository](https://github.com/infopark/scrivito_resourcebrowser).

        git clone git@github.com:_username_/scrivito_resourcebrowser.git
        cd scrivito_resourcebrowser

2. We suggest using [rbenv](https://github.com/sstephenson/rbenv/) for managing your local Ruby
   version. Make sure to use at least Ruby version 2.0.

        ruby --version

3. Create your feature branch and create a pull request for the `develop` branch. Please take a
   look at the already existing generators and rake tasks to get an impression of our coding style
   and the general architecture.

4. We are using the [GitHub Styleguides](https://github.com/styleguide) and would prefer if you
   could stick to it.


## License
Copyright (c) 2009 - 2014 Infopark AG (http://www.infopark.com)

This software can be used and modified under the LGPL-3.0. Please refer to
http://www.gnu.org/licenses/lgpl-3.0.html for the license text.
