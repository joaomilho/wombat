#coding: utf-8

module Wombat
  module Property
    module Locators
      class Text < Base
        def locate(context, page = nil)
          super { extract_text(context) }
        end
      end
    end
  end
end