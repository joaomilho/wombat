#coding: utf-8

module Wombat
  module Property
    module Locators
      class Date < Base
        def locate(context, page=nil)
          text = extract_text(context)
          case text 
          
          when /((\d{2})\/(\d{2})\/\d{4})/
            #TODO what if both ara <= 12? how can we know?
            if $2.to_i > 12
              # BR
              super { DateTime.strptime($1, '%d/%m/%Y') }
            else
              # US
              super { DateTime.strptime($1, '%m/%d/%Y') }
            end
          # JP
          when /(\d{4}-\d{2}-\d{2})/
            super { DateTime.strptime($1, '%Y-%m-%d') }
          else
            nil
          end
        end
      end
    end
  end
end