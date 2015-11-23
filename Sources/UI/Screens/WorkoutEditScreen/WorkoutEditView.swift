//
//  WorkoutEditView.swift
//  Workouter
//
//  Created by Uladzimir Papko on 10/25/15.
//  Copyright © 2015 visput. All rights reserved.
//

import UIKit

class WorkoutEditView: BaseScreenView {
    
    @IBOutlet private(set) weak var stepsTableView: UITableView!
    @IBOutlet private(set) weak var newStepButton: TintButton!
    
    override func didLoad() {
        super.didLoad()
        stepsTableView.setEditing(true, animated: false)
        stepsTableView.rowHeight = UITableViewAutomaticDimension
        stepsTableView.estimatedRowHeight = 70.0
    }
    
    override func willAppear(animated: Bool) {
        super.willAppear(animated)
        stepsTableView.deselectSelectedRowAnimated(true)
    }
    
    override func willDisappear(animated: Bool) {
        endEditing(true)
        super.willDisappear(animated)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        endEditing(true)
    }
}
