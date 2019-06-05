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
    
    static func showSuccessAlert(with text: String) {
        let appearance = standardAlertAppearance()
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess(text, subTitle: "", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 1, timeoutAction: {}), animationStyle: .bottomToTop)
    }
    
    static func showErrorAlert(with text: String) {
        let appearance = standardAlertAppearance()
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showError(text, subTitle: "", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 1, timeoutAction: {}), animationStyle: .bottomToTop)
    }
    
    static func showOnboardingAlert(with text: String, onboardingType: PersistencyController.OnboardingType) {
        let appearance = interactiveAlertAppearance()
        let alertView = SCLAlertView(appearance: appearance)
        let responder = SCLAlertViewResponder(alertview: alertView)
        alertView.addButton(NRConstants.ButtonTitles.ok) {
            PersistencyController.storeOnboarding(type: onboardingType)
            responder.close()
        }
        alertView.showInfo(text, subTitle: "", animationStyle: .bottomToTop)
    }

    private static func standardAlertAppearance() -> SCLAlertView.SCLAppearance {
        return SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: NRConstants.Font.fontBold, size: 20)!,
            kTextFont: UIFont(name: NRConstants.Font.font, size: 14)!,
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
    }
    
    static func interactiveAlertAppearance() -> SCLAlertView.SCLAppearance {
        return SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: NRConstants.Font.fontBold, size: 20)!,
            kTextFont: UIFont(name: NRConstants.Font.font, size: 14)!,
            kButtonFont: UIFont(name: NRConstants.Font.fontBold, size: 14)!,
            showCloseButton: false
        )
    }
}
