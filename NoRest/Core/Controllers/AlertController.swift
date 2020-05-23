//
//  AlertController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct AlertController {
    static func showDefaultAlert(title: String, message: String = "", in tab: RouteDestination) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)

        controller.addAction(UIAlertAction(title: "button.title.ok".localized, style: .default, handler: { _ in
            controller.dismiss(animated: true, completion: nil)
        }))

        let routeAction = RouteAction(screen: .vc(controller), in: tab, action: .present)
        store.dispatch(routeAction)
    }
    
    static func showMailAlert(title: String, message: String, actionText: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)

        controller.addAction(UIAlertAction(title: actionText, style: .default, handler: { _ in
            controller.dismiss(animated: true, completion: nil)
        }))

        let routeAction = RouteAction(screen: .vc(controller), in: .settings, action: .present)
        store.dispatch(routeAction)
    }
    
    static func showAlertForDataReset(_ resetType: SettingsController.ResetType, resetHandler: (() -> Void)?) {
        let message: String
        switch resetType {
        case .history:
            message = "alert.message.resetHistory".localized
        }
        
        let controller = UIAlertController(title: "alert.message.sure".localized, message: message, preferredStyle: .alert)

        controller.addAction(UIAlertAction(title: "button.title.cancel".localized, style: .cancel, handler: { _ in
            controller.dismiss(animated: true, completion: nil)
        }))
        
        controller.addAction(UIAlertAction(title: "button.title.reset".localized, style: .destructive, handler: { _ in
            resetHandler?()
        }))

        let routeAction = RouteAction(screen: .vc(controller), in: .settings, action: .present)
        store.dispatch(routeAction)
    }
    
    static func showDataLossAlert(dataLossHandler: (() -> Void)?) {
        let controller = UIAlertController(title: "alert.message.sure".localized, message: "alert.message.dataLoss".localized, preferredStyle: .alert)

        controller.addAction(UIAlertAction(title: "button.title.cancel".localized, style: .cancel, handler: { _ in
            controller.dismiss(animated: true, completion: nil)
        }))
        
        controller.addAction(UIAlertAction(title: "button.title.undo".localized, style: .destructive, handler: { _ in
            dataLossHandler?()
        }))

        let routeAction = RouteAction(screen: .vc(controller), in: .workouts, action: .present)
        store.dispatch(routeAction)
    }
}
