# Iso639::Validator
A Rails gem that provides the ISO 639-2 and ISO 639-1 data validations. 

The data comes from the LOC ISO 639-2 UTF-8 (http://www.loc.gov/standards/iso639-2/ascii_8bits.html) data set which provided by the gem 'iso-639' created by William Melody.

Please note that this gem is in an early stage of development and testing.

## Installation

Add this line to your application's Gemfile:

    gem 'iso639-validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso639-validator

## Usage

In your model:

    class TestModel < ActiveRecord::Base
      include Iso639::Validator
      
      # validate alfa-2 codes like 'es', 'en' 
      validates :alfa2_code, iso639Code: true, length: { is: 2 } 
      
      # validate alfa-3 codes like 'esp', 'eng' only if present.
      validates :alfa3_code, iso639Code: true, length: { is: 3 }, if: "alfa3_code.present?" 
      
      # validate a French name like 'français'
      validates :french, iso639FrenchName: true 
      
      # Validate an English name like 'English'
      validates :french, iso639EnglishName: true 
    end


Please note that validations are *case sensitive*. For example, 'es' is a valid code, but 'ES' is not. 'français' is a valid French name, but 'Français' is not.

English and French names shall be exactly the same string as in the specification.

The validator launches an :invalid, message by default.


## Contributing

Contributions and bug fixings are really appreciated 

1. Fork it ( http://github.com/merlos/iso639-validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2014 Juan M. Merlos under MIT License
