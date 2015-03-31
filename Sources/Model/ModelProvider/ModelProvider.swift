//
//  ServicesProvider.swift
//  Workouter
//
//  Created by Vladimir Popko on 1/20/15.
//  Copyright (c) 2015 visput. All rights reserved.
//

import UIKit

private let modelProvider = ModelProvider()

class ModelProvider: NSObject {
    
    class var provider: ModelProvider {
        return modelProvider
    }
    
    private(set) lazy var workoutsProvider: WorkoutsProvider = WorkoutsProvider()
}
