//
//  AlertController.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import SCLAlertView

struct AlertController {
    
    static func showSuccessAlert() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess(NRConstants.Alerts.successful, subTitle: "", animationStyle: .bottomToTop)
    }
    
    static func showSavingFailureAlert() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showError(NRConstants.Alerts.successful, subTitle: "", animationStyle: .bottomToTop)
    }
    
    static func showSavingSuccessAlert() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess(NRConstants.Alerts.savingSuccess, subTitle: "", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 1, timeoutAction: {}), animationStyle: .bottomToTop)
    }
}
