//
//  DefaultWorkoutCellItem.swift
//  Workouter
//
//  Created by Uladzimir Papko on 1/10/16.
//  Copyright © 2016 visput. All rights reserved.
//

import Foundation

struct DefaultWorkoutCellItem {
    
    /// Original workout.
    var workout: Workout
    
    /// User workout which was created by cloning default `workout`.
    var clonedWorkout: Workout?
    
    init(workout: Workout, clonedWorkout: Workout?) {
        self.workout = workout
        self.clonedWorkout = clonedWorkout
    }
}