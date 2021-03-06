//
//  StepTemplatesView.swift
//  Workouter
//
//  Created by Uladzimir Papko on 11/3/15.
//  Copyright © 2015 visput. All rights reserved.
//

import UIKit

class StepTemplatesView: BaseScreenView {
    
    @IBOutlet private(set) weak var templatesTableView: UITableView!
    
    override func didLoad() {
        super.didLoad()
        templatesTableView.rowHeight = UITableViewAutomaticDimension
        templatesTableView.estimatedRowHeight = 70.0
    }
    
    override func willAppear(animated: Bool) {
        super.willAppear(animated)
        templatesTableView.deselectSelectedRowAnimated(true)
    }
}
