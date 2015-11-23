//
//  TextDialog.swift
//  Workouter
//
//  Created by Uladzimir Papko on 11/20/15.
//  Copyright © 2015 visput. All rights reserved.
//

import UIKit

final class TextDialog: BaseDialog {
    
    enum Style {
        case Info
        case Error
    }
    
    var style = Style.Info {
        didSet {
            guard isViewLoaded() else { return }
            updateViews()
        }
    }

    var primaryText = "" {
        didSet {
            guard isViewLoaded() else { return }
            updateViews()
        }
    }
    
    var secondaryText = "" {
        didSet {
            guard isViewLoaded() else { return }
            updateViews()
        }
    }
    
    var icon: UIImage? {
        didSet {
            guard isViewLoaded() else { return }
            updateViews()
        }
    }
    
    private var textView: TextDialogView {
        return view as! TextDialogView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}

extension TextDialog {
    
    private func updateViews() {
        textView.primaryTextLabel.text = primaryText
        textView.secondaryTextLabel.text = secondaryText
        
        if icon != nil {
            textView.iconView.image = icon
        } else {
            switch style {
            case .Info: textView.iconView.image = UIImage(named: "icon_info_primary")
            case .Error: textView.iconView.image = UIImage(named: "icon_info_invalid_state")
            }
        }
    }
}
