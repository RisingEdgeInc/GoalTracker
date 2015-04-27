//
//  GoalView.swift
//  GoalTracker
//
//  Created by Michael Falzone on 4/26/15.
//  Copyright (c) 2015 Rising Edge. All rights reserved.
//

import UIKit

class GoalView: UIView {
  var goalAmount: Int = 0
  var percentGoalAchieved: Double = 0
  var goalName: String {
    get { return self.goalName }
    set { goalNameLabel.text = newValue }
  }

  @IBOutlet weak var goalNameLabel: UILabel!
  @IBOutlet weak var totalGoalAmountLabel: UILabel!
  @IBOutlet weak var amountGoalAchievedLabel: UILabel!
  @IBOutlet weak var progressIndicatorBackground: UIView!
  @IBOutlet weak var progressIndicatorForeground: UIView!
  @IBOutlet weak var progressIndicatorPercentLabel: UILabel!
  
  class func goalViewWithName(name: String, percent: Double, ofGoal goal: Int) -> GoalView {
    let goalView = self.loadFromNibNamed("GoalView") as GoalView
    goalView.percentGoalAchieved = percent
    goalView.goalAmount = goal
    goalView.goalName = name

    let numberFormatter = NSNumberFormatter()
    numberFormatter.numberStyle = .CurrencyStyle
    numberFormatter.roundingMode = .RoundDown
    numberFormatter.maximumFractionDigits = 0
    goalView.totalGoalAmountLabel.text = numberFormatter.stringFromNumber(goal)
    goalView.amountGoalAchievedLabel.text = numberFormatter.stringFromNumber(percent * Double(goal))
    
    numberFormatter.numberStyle = .PercentStyle
    goalView.progressIndicatorPercentLabel.text = numberFormatter.stringFromNumber(percent)
    return goalView
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.progressIndicatorForeground.frame = CGRectMake(0, 0,
        CGRectGetWidth(self.progressIndicatorBackground.bounds) * CGFloat(self.percentGoalAchieved),
        CGRectGetHeight(self.progressIndicatorBackground.bounds))
  }
  
  class func loadFromNibNamed(nibNamed: String, bundle: NSBundle? = nil) -> UIView? {
    let nib = UINib(nibName: nibNamed, bundle: bundle)
    return nib.instantiateWithOwner(self, options: nil)[0] as? UIView
  }
}
