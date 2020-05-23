//
//  SettingsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import AVKit
import MessageUI
import StoreKit

class SettingsController {    
    enum SettingsItemsType {
        case unit
        case timer
        case action(String, () -> Void)
    }
    
    enum ResetType {
        case history
    }
    
    static var isTimerSoundActivated: Bool {
        return UserDefaultsController.isTimerSoundEnabled
    }
    
    static var currentUnit: Unit {
        return UserDefaultsController.unit
    }
    
    static var currentUnitAsIndex: Int {
        return Unit.allCases.firstIndex(of: currentUnit) ?? 0
    }
    
    var settingsItems: [SettingsItemsType] = []
    
    private lazy var mailCtrl = MailController()
    
    init() {
        self.settingsItems = [
            .unit,
            .timer,
            .action("settings.resetHistory".localized,
                    { AlertController.showAlertForDataReset(.history, resetHandler: { self.reset(.history) }) }),
            .action("settings.share".localized, { self.showSharingOption() }),
            .action("settings.showRating".localized, { self.showRating() }),
            .action("settings.contact".localized, { self.showContact() }),
            .action("settings.licenses".localized, { self.showInfoViewController(.licenses) }),
            .action("settings.disclaimer".localized, { self.showInfoViewController(.disclaimer) }),
        ]
    }
    
    func timerSoundStateChanged(to state: Bool) {
        UserDefaultsController.isTimerSoundEnabled = state
    }
    
    func unitChanged(to index: Int) {
        let newUnit = Unit.allCases[index]
        UserDefaultsController.unit = newUnit
    }
    
    func reset(_ resetType: ResetType) {
        switch resetType {
        case .history:
            WorkoutHistory.resetHistory()
        }
    }
    
    private func showSharingOption() {
        let mailSubject = "settings.share.mailSubject".localized
        let customTitle = "settings.share.title".localized

        let shareObject = ShareObject(shareData: "", mailSubject: mailSubject, customTitle: customTitle)
        let activityCtrl = UIActivityViewController(activityItems: [shareObject], applicationActivities: nil)
        
        let routeAction = RouteAction(screen: .vc(activityCtrl), in: .settings, action: .present)
        store.dispatch(routeAction)
    }
    
    private func showRating() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
    
    private func showContact() {
        guard let mail = mailCtrl.createMailController(to: NRConstants.mail, subject: "settings.contact.subject".localized, body: "") else {
            AlertController.showMailAlert(title: "alert.message.noMail.title".localized,
                            message: "alert.message.noMail.description".localized,
                            actionText: "button.title.close".localized)
            return
        }
        
        let routeAction = RouteAction(screen: .vc(mail), in: .settings, action: .present)
        store.dispatch(routeAction)
    }
    
    private func showInfoViewController(_ info: Info) {
        let infoAction = InfoAction(info: info)
        store.dispatch(infoAction)
        
        let routeAction = RouteAction(screen: .info, in: .settings, action: .presentInNav)
        store.dispatch(routeAction)
    }
}
