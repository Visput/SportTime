//
//  WorkoutsView.swift
//  Workouter
//
//  Created by Uladzimir Papko on 3/21/15.
//  Copyright (c) 2015 visput. All rights reserved.
//

import Foundation
import UIKit

final class WorkoutsView: BaseScreenView {
    
    enum ViewMode {
        case Standard
        case Edit
        
        func title() -> String {
            switch self {
            case .Standard:
                return NSLocalizedString("Edit", comment: "")
            case .Edit:
                return NSLocalizedString("Done", comment: "")
            }
        }
    }
    
    var mode = ViewMode.Standard {
        didSet {
            switch mode {
            case .Edit:
                workoutsTableView.setEditing(true, animated: true)
            case .Standard:
                workoutsTableView.setEditing(false, animated: true)
            }
            modeButtonItem.title = mode.title()
        }
    }
    
    func switchMode() {
        switch mode {
        case .Standard:
            mode = .Edit
        case .Edit:
            mode = .Standard
        }
    }
    
    @IBOutlet private(set) weak var workoutsTableView: UITableView!
    @IBOutlet private weak var modeButtonItem: UIBarButtonItem!
    
    override func didLoad() {
        super.didLoad()
        workoutsTableView.rowHeight = UITableViewAutomaticDimension
        workoutsTableView.estimatedRowHeight = 100.0
    }
    
    override func willAppear(animated: Bool) {
        super.willAppear(animated)
        workoutsTableView.deselectSelectedRowAnimated(true)
    }
}
