//
//  ViewController.swift
//  iOSBarChart
//
//  Created by Damiaan Dufaux on 11/05/15.
//  Copyright (c) 2015 Damiaan Dufaux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	
	@IBOutlet var part1: NSLayoutConstraint!
	@IBOutlet var part2: NSLayoutConstraint!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func randomize(sender: AnyObject) {
		let r1 = CGFloat(arc4random()) / CGFloat(UINT32_MAX)
		let r2 = CGFloat(arc4random()) / CGFloat(UINT32_MAX) * (1-r1)
		let newPart1 = part1.withMultiplier(r1)
		let newPart2 = part2.withMultiplier(r2)
		view.layoutIfNeeded()
		UIView.animateWithDuration(0.45) {
			self.view.removeConstraints([self.part1, self.part2])
			self.view.addConstraints(   [ newPart1 ,  newPart2 ])
			(self.part1, self.part2) = (newPart1, newPart2)
			self.view.layoutIfNeeded()
		}
	}

}

extension NSLayoutConstraint {
	func withMultiplier(newMultiplier: CGFloat) -> NSLayoutConstraint {
		return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: newMultiplier, constant: constant)
	}
}