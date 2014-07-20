require "iso639/validator/version"

require 'active_model'
require "iso-639"

module Iso639
  module Validator
        
    class Iso639CodeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if ISO_639.find_by_code(value).nil? 
          record.errors.add(attribute, options[:message] || :invalid)
        end 
    	end
    end
 
    
    #checks that the value exists in the database and is unique
    class Iso639EnglishNameValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)   
        if ISO_639.find_by_english_name(value).nil? 
          record.errors.add(attribute, options[:message] || :invalid)
        end 
        return true
    	end
    end
    
    
    # Checks that the value exists in the database and is unique 
    class Iso639FrenchNameValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value) 
        if ISO_639.find_by_french_name(value).nil?
          record.errors.add(attribute, options[:message] || :invalid)
        end 
        return true
    	end
    end
    
    
  end
end
