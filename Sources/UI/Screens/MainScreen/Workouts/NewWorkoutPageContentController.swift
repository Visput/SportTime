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
    
    private var workoutsProvider: WorkoutsProvider {
        return modelProvider.workoutsProvider
    }
    
    @IBAction private func actionButtonDidPress(sender: AnyObject) {
        let searchRequest = WorkoutsSearchRequest(searchText: "", isTemplates: true, group: .AllWorkouts)
        navigationManager.presentWorkoutTemplatesScreenWithRequest(searchRequest,
            animated: true,
            templateDidSelectAction: { [unowned self] workout in
                
                self.navigationManager.pushWorkoutEditScreenWithWorkout(workout,
                    animated: true,
                    workoutDidEditAction: { [unowned self] workout in
                        
                        self.workoutsProvider.addWorkout(workout)
                        self.navigationManager.dismissScreenAnimated(true)
                        self.navigationManager.pushWorkoutDetailsScreenWithWorkout(workout, animated: true)
                    })
                
            }, templateDidCancelAction: {
                self.navigationManager.dismissScreenAnimated(true)
        })
    }
}
