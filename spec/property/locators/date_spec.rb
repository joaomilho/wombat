require 'spec_helper'

describe Wombat::Property::Locators::Date do
	it 'should locate brazilian date with xpath selector and namespaces' do
		fake_elem = double :element
		context   = double :context
		fake_elem.stub inner_text: "Something 30/01/2012 cool "
		context.stub(:xpath).with("/abc", 'boom').and_return [fake_elem]
		property = Wombat::DSL::Property.new('data1', 'xpath=/abc', :text, 'boom')

		locator = Wombat::Property::Locators::Date.new(property)
	
		locator.locate(context).should == { "data1" => Date.new(2012, 01, 30) }
  end

	it 'should locate us date with xpath selector and namespaces' do
		fake_elem = double :element
		context   = double :context
		fake_elem.stub inner_text: "Something 01/30/2012 cool "
		context.stub(:xpath).with("/abc", 'boom').and_return [fake_elem]
		property = Wombat::DSL::Property.new('data1', 'xpath=/abc', :text, 'boom')

		locator = Wombat::Property::Locators::Date.new(property)
	
		locator.locate(context).should == { "data1" => Date.new(2012, 01, 30) }
  end

	it 'should locate japanese date with xpath selector and namespaces' do
		fake_elem = double :element
		context   = double :context
		fake_elem.stub inner_text: "Something 2012-01-30 cool "
		context.stub(:xpath).with("/abc", 'boom').and_return [fake_elem]
		property = Wombat::DSL::Property.new('data1', 'xpath=/abc', :text, 'boom')

		locator = Wombat::Property::Locators::Date.new(property)
	
		locator.locate(context).should == { "data1" => Date.new(2012, 01, 30) }
  end

  it 'should locate date with xpath selector using xpath functions' do
    context   = double :context
    context.stub(:xpath).with('concat(/abc, /def)', nil).and_return "    30/01/2012 Something "
    property = Wombat::DSL::Property.new('data1', 'xpath=concat(/abc, /def)', :text)

    locator = Wombat::Property::Locators::Date.new(property)

    locator.locate(context).should == { "data1" => Date.new(2012, 01, 30) }
  end

	it 'should locate date with css selector' do
		fake_elem = double :element
		context   = double :context
		fake_elem.stub inner_text: "My 30/01/2012 name"
		context.stub(:css).with("/def").and_return [fake_elem]
		property = Wombat::DSL::Property.new('data1', 'css=/def', :text)
		
		locator = Wombat::Property::Locators::Date.new(property)
	
		locator.locate(context).should == { "data1" => Date.new(2012, 01, 30) }
	end

end