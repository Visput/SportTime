//
//  ScreenManager.swift
//  Workouter
//
//  Created by Uladzimir Papko on 10/27/15.
//  Copyright © 2015 visput. All rights reserved.
//

import UIKit

class ScreenManager: NSObject {
    
    var window: UIWindow!
    
    var storyboard: UIStoryboard {
        return window.rootViewController!.storyboard!
    }
    
    var navigationController: UINavigationController {
        return window.rootViewController! as! UINavigationController
    }
}

extension ScreenManager {
    
    func popScreenAnimated(animated: Bool) {
        navigationController.popViewControllerAnimated(animated)
    }
    
    func popToWorkoutsScreenAnimated(animated: Bool) {
        navigationController.popToRootViewControllerAnimated(animated)
    }
}

extension ScreenManager {
    
    func pushWorkoutDetailsScreenFromCurrentScreenWithWorkout(workout: Workout) {
        let screen = storyboard.instantiateViewControllerWithIdentifier(WorkoutDetailsScreen.className()) as! WorkoutDetailsScreen
        navigationController.pushViewController(screen, animated: true)
    }
    
    func pushWorkoutDetailsScreenFromPreviousScreenWithWorkout(workout: Workout) {
        let screen = storyboard.instantiateViewControllerWithIdentifier(WorkoutDetailsScreen.className()) as! WorkoutDetailsScreen
        screen.workout = workout
        
        var screens = navigationController.viewControllers
        navigationController.pushViewController(screen, animated: true)
        screens.removeLast()
        screens.append(screen)
        navigationController.viewControllers = screens
    }
    
    func pushWorkoutDetailsScreenFromWorkoutsScreenWithWorkout(workout: Workout) {
        let screen = storyboard.instantiateViewControllerWithIdentifier(WorkoutDetailsScreen.className()) as! WorkoutDetailsScreen
        screen.workout = workout
        
        navigationController.pushViewController(screen, animated: true)
        navigationController.viewControllers = [navigationController.viewControllers[0], screen]
    }
}

extension ScreenManager {
    
    func pushWorkoutEditScreenFromWorkoutsScreenWithWorkout(workout: Workout?, workoutDidEditAction: ((workout: Workout) -> ())?) {
        let screen = storyboard.instantiateViewControllerWithIdentifier(WorkoutEditScreen.className()) as! WorkoutEditScreen
        screen.workout = workout
        screen.workoutDidEditAction = workoutDidEditAction
        
        navigationController.pushViewController(screen, animated: true)
        navigationController.viewControllers = [navigationController.viewControllers[0], screen]
    }
    
    func pushStepEditScreenFromCurrentScreenWithStep(step: Step?, stepDidEditAction: ((step: Step) -> ())?) {
        let screen = storyboard.instantiateViewControllerWithIdentifier(StepEditScreen.className()) as! StepEditScreen
        screen.step = step
        screen.stepDidEditAction = stepDidEditAction
        
        navigationController.pushViewController(screen, animated: true)
    }
}
