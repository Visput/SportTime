//
//  WorkoutPlayer.swift
//  Workouter
//
//  Created by Uladzimir Papko on 1/21/15.
//  Copyright (c) 2015 visput. All rights reserved.
//

import UIKit

final class WorkoutPlayer: NSObject {
    
    private(set) var workout: Workout?
   
    func startWorkout(workout: Workout) {
        self.workout = workout
    }
    
    func stopWorkout() {
        workout = nil
    }
}
