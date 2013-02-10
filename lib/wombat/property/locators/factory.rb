#coding: utf-8
require 'wombat/property/locators/base'
require 'wombat/property/locators/date'
require 'wombat/property/locators/follow'
require 'wombat/property/locators/html'
require 'wombat/property/locators/iterator'
require 'wombat/property/locators/property_group'
require 'wombat/property/locators/list'
require 'wombat/property/locators/number'
require 'wombat/property/locators/text'
require 'wombat/property/locators/headers'


class Wombat::Property::Locators::UnknownTypeException < Exception; end;

module Wombat
	module Property
		module Locators
			module Factory

				@@properties_map = {
					text: Text,
					number: Number,
					date: Date,
					list: List,
					html: Html,
					iterator: Iterator,
					container: PropertyGroup,
					follow: Follow,
					headers: Headers
				}

				def self.locator_for(property)
					klass = @@properties_map[property.wombat_property_format]
      		raise Wombat::Property::Locators::UnknownTypeException.new("Unknown property format #{property.format}.") unless klass
					klass.new(property)
				end
			end
		end
	end
end