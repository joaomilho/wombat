#coding: utf-8

module Wombat
  module Property
    module Locators
      class Number < Base
        def locate(context, page=nil)
          super { extract_text(context).scan(/\d+/).flatten.first.to_i }
        end
      end
    end
  end
end