#
#  PomodoroController.rb
#  Pomodoro
#
#  Created by Jair Gaxiola on 6/16/12.
#  Copyright 2012 __MyCompanyName__. All rights reserved.
#

class PomodoroController
    attr_accessor :timer_label, :start_stop_button
    attr_accessor :pomodoro_timer, :min_left
    
    def awakeFromNib
        @min_left = 25
    end
    
    def start_stop_button(sender)
        if @pomodoro_timer.nil?
            @pomodoro_timer = NSTimer.scheduledTimerWithTimeInterval(60, target:self, selector:"min_passed:", userInfo:nil, repeats:true)
            @timer_label.textColor = NSColor.redColor
            @start_stop_button.title = "Stop Pomodoro"
        else
            reset_interface
        end
    end
    
    def min_passed(timer)
        if @min_left > 1
            @min_left -= 1
            @timer_label.stringValue = @min_left
        else
            reset_interface
            alert_user
        end
    end
    
    def reset_interface
        @min_left = 25
        @timer_label.stringValue = @min_left
        @timer_label.textColor = NSColor.blackColor
        @start_stop_button.title = "Start Pomodoro"
        @pomodoro_timer.invalidate
        @pomodoro_timer = nil
    end
    
    def alert_user
        voice = NSSpeechSynthesizer.alloc.initWithVoice("com.apple.speech.synthesis.voice.BadNews")
        voice.startSpeakingString("Pomodoro complete. Time for a short break")
    end

end
