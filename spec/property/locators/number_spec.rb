require 'spec_helper'

describe Wombat::Property::Locators::Number do
	it 'should locate number with xpath selector and namespaces' do
		fake_elem = double :element
		context   = double :context
		fake_elem.stub inner_text: "Something 123 cool "
		context.stub(:xpath).with("/abc", 'boom').and_return [fake_elem]
		property = Wombat::DSL::Property.new('data1', 'xpath=/abc', :text, 'boom')

		locator = Wombat::Property::Locators::Number.new(property)
	
		locator.locate(context).should == { "data1" => 123 }
  end

  it 'should locate number with xpath selector using xpath functions' do
    context   = double :context
    context.stub(:xpath).with('concat(/abc, /def)', nil).and_return "    456 Something "
    property = Wombat::DSL::Property.new('data1', 'xpath=concat(/abc, /def)', :text)

    locator = Wombat::Property::Locators::Number.new(property)

    locator.locate(context).should == { "data1" => 456 }
  end

	it 'should locate number with css selector' do
		fake_elem = double :element
		context   = double :context
		fake_elem.stub inner_text: "My 789 name"
		context.stub(:css).with("/def").and_return [fake_elem]
		property = Wombat::DSL::Property.new('data1', 'css=/def', :text)
		
		locator = Wombat::Property::Locators::Number.new(property)
	
		locator.locate(context).should == { "data1" => 789 }
	end

end