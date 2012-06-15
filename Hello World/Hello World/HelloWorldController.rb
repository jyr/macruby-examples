#
#  HelloWorldController.rb
#  Hello World
#
#  Created by Jair Gaxiola on 6/12/12.
#  Copyright 2012 __MyCompanyName__. All rights reserved.
#

class HelloWorldController
    attr_accessor   :hello_label, :hello_button, :hello
    
    def awakeFromNib
        @hello = true
    end
    
    def changeLabel(sender)
        if @hello
            @hello_label.stringValue = "Good bye"
            @hello_button.title ="Hello"
            @hello = false
        else
            @hello_label.stringValue = "Hey Arnold!"
            @hello_button.title = "Good bye"
            @hello = true
        end
    end
end 