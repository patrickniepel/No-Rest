//
//  LicensesViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 31.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let infoTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = NRStyle.themeColor
        tv.textColor = NRStyle.primaryTextColor
        tv.font = UIFont(name: NRStyle.regularFont, size: 12)
        tv.isUserInteractionEnabled = true
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        setupScreen()
    }
    
    private func setupScreen() {
        view.backgroundColor = NRStyle.themeColor
        setupLicensesTextView()
    }
    
    private func setupLicensesTextView() {
        view.addSubview(infoTextView)
        infoTextView.fillSuperview()
    }
    
    func setupInfo(info: Info) {
        infoTextView.text = info == .licenses ? licenses : disclaimer
        navigationItem.title = info == .licenses ? NRConstants.ScreenTitles.licenses : NRConstants.ScreenTitles.disclaimer
    }
    
    deinit {
        unsubscribe()
    }
    
    let licenses = """
    tabbaritem dumbbell:
    https://www.iconfinder.com/icons/310338/dumbbell_sport_icon
    https://www.iconfinder.com/visualpharm

    tabbaritem workout:
    https://www.iconfinder.com/icons/4042280/dumbell_gym_healthy_life_take_exercise_training_weight_workout_icon
    https://www.iconfinder.com/Chanut-is

    bin icon:
    https://iconmonstr.com/trash-can-6-png/

    play icon:
    https://iconmonstr.com/video-14-png/

    edit icon:
    https://iconmonstr.com/pencil-10-png/

    date icon:
    https://iconmonstr.com/calendar-6-png/

    timer icon:
    https://iconmonstr.com/time-19-png/

    notes icon:
    https://iconmonstr.com/note-23-svg/

    x icon:
    https://iconmonstr.com/x-mark-1-png/

    arrow icon:
    https://www.iconfinder.com/icons/183254/arrow_forward_right_icon
    """
    
    let disclaimer = """
    Health and fitness information disclaimer
    1. Credit
        1.1 This document was created using a template from Docular (https://docular.net).
    2. No advice
        2.1 The application contains fitness information.
        2.2 The fitness information is not advice and should not be treated as such.
    3. No warranties
        3.1 The fitness information in our application is provided without any representations or warranties, express or implied.
        3.2 Without limiting the scope of Section 3.1, we do not warrant or represent that the fitness information in this  application:
            (a) will be constantly available, or available at all; or
            (b) is true, accurate, complete, current or non-misleading.
    4. Health and fitness information
        4.1 You acknowledge that all exercise involves a risk of personal injury, including a small risk of serious injury or death, and agree that you are responsible for your health and well-being in relation to any exercise programme that you may undertake, whether or not such exercise programme uses the health and fitness information within this application.
        4.2 If you are pregnant or suffer from any medical or physical condition or disability, you should not make any changes to  your diet, nutrition, lifestyle, activities or exercise programmes based on the fitness information published on our website without first consulting your doctor or another suitably qualified professional.
    5. Medical assistance
        5.1 You must not rely on the information on our website as an alternative to medical advice from your doctor or other   professional healthcare provider.
        5.2 If you have any specific questions about any medical matter, you should consult your doctor or other professional   healthcare provider.
        5.3 If you think you may be suffering from any medical condition, you should seek immediate medical attention.
        5.4 You should never delay seeking medical advice, disregard medical advice or discontinue medical treatment because of information in this application.
    6. No liability
        6.1 Subject to Section 7, we will not be liable to you in respect of any loss, injury or damage you may suffer as a     consequence your reliance upon the information published on our website.
    7. Limits upon exclusions of liability
        7.1 Nothing in this disclaimer will:
        (a) limit or exclude any liability for death or personal injury resulting from negligence;
        (b) limit or exclude any liability for fraud or fraudulent misrepresentation;
        (c) limit any liabilities in any way that is not permitted under applicable law; or
        (d) exclude any liabilities that may not be excluded under applicable law.
    """
}
