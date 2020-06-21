//
//  ShareObject.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import LinkPresentation
import UIKit

class ShareObject: NSObject, UIActivityItemSource {

    private let shareData: Any
    private let mailSubject: String?
    private let customTitle: String?

    init(shareData: Any, mailSubject: String? = nil, customTitle: String? = nil) {
        self.shareData = shareData
        self.mailSubject = mailSubject
        self.customTitle = customTitle
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return shareData
    }

    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return mailSubject ?? ""
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return shareData
    }

    @available(iOS 13.0, *)
    func activityViewControllerLinkMetadata(_: UIActivityViewController) -> LPLinkMetadata? {
        guard let customTitle = customTitle else { return nil }
        let metadata = LPLinkMetadata()
        metadata.title = customTitle
        return metadata
    }
}
