//
//  ColorView.swift
//  BarChart
//
//  Created by Damiaan Dufaux on 11/05/15.
//  Copyright (c) 2015 Damiaan Dufaux. All rights reserved.
//

import Cocoa

@IBDesignable class ColorView: NSView {
	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
	}

	required init?(coder: NSCoder) {
	    super.init(coder: coder)
	}

	@IBInspectable var backgroundColor = NSColor.blueColor()
	
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
		backgroundColor.setFill()
		NSRectFill(dirtyRect)
        // Drawing code here.
    }
	
	
}
