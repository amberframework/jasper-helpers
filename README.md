[![Build Status](https://travis-ci.org/Amber-Crystal/Jasper-Helpers.svg?branch=master)](https://travis-ci.org/Amber-Crystal/Jasper-Helpers)
# Jasper::Helpers

A library of helpers for Amber Framework.

## Installation

Add this to your application's shard.yml:

```yaml
dependencies:
  jasper_helpers:
    github: amberframework/jasper-helpers
```

## Usage

```crystal
require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"
end
```

## Contributing

1. Fork it ( https://github.com/amberframework/Jasper-Helpers/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [elorest](https://github.com/elorest) Isaac Sloan - Maintainer
- [skunkworker](https://github.com/skunkworker) John Bolliger Maintainer
