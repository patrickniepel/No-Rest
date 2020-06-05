//
//  MailController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import MessageUI

class MailController: NSObject, MFMailComposeViewControllerDelegate {
    func createMailController(to: String, subject: String, body: String) -> MFMailComposeViewController? {
        guard MFMailComposeViewController.canSendMail() else {
            return nil
        }

        let barAppearance = UINavigationBar.appearance()

        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([to])
        mail.setSubject(subject)
        mail.setMessageBody(body, isHTML: false)

        if UIDevice.current.systemVersion.compare("13.0", options: .numeric) == .orderedAscending {
            barAppearance.isTranslucent = true
        }

        return mail
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

