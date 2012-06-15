framework 'cocoa'
app = NSApplication.sharedApplication

win = NSWindow.alloc.initWithContentRect([300,500,400,200],styleMask:NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask,  backing: NSBackingStoreBuffered, defer:false)

label = NSTextField.alloc.initWithFrame CGRectMake(0,0,250, 45)
label.setStringValue "Hey Arnold!"
label.drawsBackground = false
label.bezeled = false
label.font = NSFont.fontWithName("Arial", size: 45.0)
label.editable = false

label.frameOrigin = NSMakePoint((win.contentView.frameSize.width/2.0) -(label.frameSize.width/2.0), (win.contentView.frameSize.height/2.0) -(label.frameSize.height/2.0) )
puts win.contentView.class.ancestors
win.contentView.addSubview(label)
win.title = "Hey Guys!"
win.display
win.orderFrontRegardless
win.makeKeyWindow

app.run
