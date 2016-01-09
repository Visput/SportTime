//
//  WorkoutsSource.swift
//  Workouter
//
//  Created by Uladzimir Papko on 1/1/16.
//  Copyright © 2016 visput. All rights reserved.
//

import UIKit

protocol WorkoutsSource: UICollectionViewDataSource, UICollectionViewDelegate, UIViewControllerPreviewingDelegate {
    
    var active: Bool { get set }
    
    func searchWorkoutsWithText(text: String)
    func resetSearchResults()
}
