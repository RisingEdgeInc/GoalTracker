//
//  TodayViewController.swift
//  GoalTrackerWidget
//
//  Created by Michael Falzone on 4/26/15.
//  Copyright (c) 2015 Rising Edge. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

  override func viewDidLoad() {
    super.viewDidLoad()
    let firstGoal = GoalView.goalViewWithName("Awesome Goal", percent: 0.25, ofGoal: 100000)
    firstGoal.frame = CGRectMake(0, 0, CGRectGetWidth(firstGoal.bounds), CGRectGetHeight(firstGoal.bounds))
    self.view.addSubview(firstGoal)
    
    let secondGoal = GoalView.goalViewWithName("More Awesomeness", percent: 0.62, ofGoal: 50000)
    secondGoal.frame = CGRectMake(0, CGRectGetMaxY(firstGoal.frame), CGRectGetWidth(secondGoal.bounds), CGRectGetWidth(secondGoal.bounds))
    self.view.addSubview(secondGoal)
  }
  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
      // Perform any setup necessary in order to update the view.

      // If an error is encountered, use NCUpdateResult.Failed
      // If there's no update required, use NCUpdateResult.NoData
      // If there's an update, use NCUpdateResult.NewData

      completionHandler(NCUpdateResult.NewData)
  }
  
}
