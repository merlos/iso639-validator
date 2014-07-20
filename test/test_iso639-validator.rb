require 'rubygems'
require "minitest/autorun"
require 'active_record'
require 'active_model'
require 'iso639/validator'

module Iso639
  module Validator

    #
    # Helper class to test Code
    #
    class TestCode
      include ActiveModel::Validations
      include Iso639::Validator
      attr_accessor :code
      
      validates :code, iso639Code: true 
      
      def initialize(attrs = {})
          attrs.each_pair { |k,v| send("#{k}=", v) }
        end
    end
    
    # this class is to test a code with other conditions, for docummentation.
    #
    class TestCode3
      include ActiveModel::Validations
      include Iso639::Validator
      attr_accessor :code
    
      # validate alfa-3 codes like 'esp', 'eng' only if present.
      validates :code, iso639Code: true, length: { is: 3 }, if: "code.present?" 
      
      def initialize(attrs = {})
          attrs.each_pair { |k,v| send("#{k}=", v) }
        end
    end
    
    #
    # Helper class to test French Name
    #
    class TestFrench
      include ActiveModel::Validations
      include Iso639::Validator
      attr_accessor :french
      
      validates :french, iso639FrenchName: true 
      
      def initialize(attrs = {})
          attrs.each_pair { |k,v| send("#{k}=", v) }
        end
    end
    
    #
    # Helper class to test English Name
    #
    class TestEnglish
      include ActiveModel::Validations
      include Iso639::Validator
      attr_accessor :english
      
      validates :english, iso639EnglishName: true 
      
      def initialize(attrs = {})
          attrs.each_pair { |k,v| send("#{k}=", v) }
      end
    end
    
    #
    # Tests
    #
    class Iso639ValidatorTests < Minitest::Test #Test::Unit::TestCase
      
      # Code Tests
      def test_a_valid_code
        t = TestCode.new(code:'es')   
        assert t.valid?
        #puts t.valid?
        #t.errors.each do |f| puts f end      
        t1 = TestCode.new(code:'en')   
        assert t1.valid?
        #puts t.valid?
        #t.errors.each do |f| puts f end      
      end
  
      def test_an_empty_code
        t = TestCode.new()
        assert (not t.valid?)
      end
      
      def test_a_non_existing_code 
        t = TestCode.new(code:'zz')
        assert (not t.valid?)
      end
      
      def test_a_name_with_find_by_code
        t = TestCode.new(code:'espagnol');
        assert (not t.valid?)
        t.code = 'Spanish'
        assert (not t.valid?)
      end
      
      
      def test_an_empty_code_conditional_presence
        t = TestCode3.new()
        assert t.valid? #it's ok is empty
      end
      
      def test_a_code2_requiring_length3_presence
        t = TestCode3.new()
        assert t.valid? #it's ok, is empty
        t.code='es'
        assert (not t.valid?) 
      end
      
      def test_a_code2_requiring_length3_presence
        t = TestCode3.new(code:'esp')
        assert t.valid? #it's ok is empty
        assert (not t.valid?) 
      end
      
      
      # French tests 
      def test_valid_french_name
        t = TestFrench.new(french:'français')
        assert t.valid?
      end
      
      def test_invalid_french_name
        t = TestFrench.new(french:'Español')
        assert (not t.valid?)
      end
      
      # English 
      def test_valid_english_name
        t = TestEnglish.new(english:'Russian')
        assert t.valid?
      end
      
      def test_invalid_english_name
        t = TestEnglish.new(english:'Español')
        assert (not t.valid?)
      end
      
    end

  end #validator module
end #iso


  