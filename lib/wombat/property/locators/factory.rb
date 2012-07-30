#coding: utf-8
require 'wombat/property/locators/base'
require 'wombat/property/locators/follow'
require 'wombat/property/locators/html'
require 'wombat/property/locators/iterator'
require 'wombat/property/locators/property_container'
require 'wombat/property/locators/list'
require 'wombat/property/locators/text'

class Wombat::Property::Locators::UnknownTypeException < Exception; end;

module Wombat
	module Property
		module Locators
			module Factory
				def self.locator_for(property, context)
					klass = case(property.format)
					when :text 
						Text
					when :list
						List
					when :html 
						Html
					when :iterator
						Iterator
					when :container
						PropertyContainer
					when :follow
						Follow
					else 
	      		raise Wombat::Property::Locators::UnknownTypeException.new("Unknown property format #{property.format}.")
					end

					klass.new(property, context)
				end
			end
		end
	end
end