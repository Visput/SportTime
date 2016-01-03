//
//  NewWorkoutPageContentController.swift
//  Workouter
//
//  Created by Uladzimir Papko on 12/27/15.
//  Copyright © 2015 visput. All rights reserved.
//

import UIKit

final class NewWorkoutPageContentController: BaseViewController, WorkoutPageContentControlling {

    var item: WorkoutPageItem!
    
    private var navigationManager: NavigationManager {
        return modelProvider.navigationManager
    }
    
    @IBAction private func actionButtonDidPress(sender: AnyObject) {
        navigationManager.pushWorkoutsScreenWithSourceType(.User, animated: true)
    }
}
