//
//  TimerView.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .backgroundColorUIControl
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 50)
        return label
    }()
    
    weak var delegate: PopUpDelegate?
    
    private var seconds: Int = 0
    private var timerCounter: Int = 0
    private var animationCounter: Int = 0
    private var timer: Timer?
    private var animationTimer: Timer?
    
    private var didSetupLayout = false
    private var shapeLayer: CAShapeLayer!
    private var pulsatingLayer: CAShapeLayer!
    private let lineWidth: CGFloat = 20
    private let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
    private let timerBackgroundColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)

    convenience init(seconds: Int) {
        self.init()
        self.seconds = seconds
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !didSetupLayout {
            setupLayout()
            didSetupLayout = true
        }
    }
    
    private func setup() {
        timerCounter = seconds
        animationCounter = seconds * 100
        layoutIfNeeded()
        setupDesign()
    }
    
    private func setupDesign() {
        backgroundColor = timerBackgroundColor
        layer.cornerRadius = 25
        layer.borderColor = timerBackgroundColor.cgColor
        layer.borderWidth = 1
    }
    
    private func updateTimerLabel() {
        let minutes = timerCounter / 60
        let seconds = timerCounter % 60
        
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let timerText = minutes == 0 ? "\(secondsString)" : "\(minutes):\(secondsString)"
        timerLabel.text = timerText
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        animationTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(handleAnimationTimer), userInfo: nil, repeats: true)
        animatePulsatingLayer()
    }
    
    func stopTimers() {
        stopMainTimer()
        stopAnimationTimer()
    }
    
    private func stopMainTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func stopAnimationTimer() {
        animationTimer?.invalidate()
        animationTimer = nil
    }
    
    @objc private func handleTimer() {
        if timerCounter == 0 {
            stopMainTimer()
            SoundController.playTimerSound()
            delegate?.timerDidEnd()
            return
        }
        
        timerCounter -= 1
        updateTimerLabel()
    }
    
    @objc private func handleAnimationTimer() {
        if animationCounter == 0 {
            stopAnimationTimer()
            return
        }
        animationCounter -= 1
        animateCircle()
    }
    
    deinit {
        stopTimers()
    }
}

private extension TimerView {
    
    func setupLayout() {
        setupShapeLayer()
        setupTimerLabel()
    }
    
    func setupTimerLabel() {
        addSubview(timerLabel)
        
        updateTimerLabel()
        timerLabel.centerInSuperview()
    }
    
    func setupShapeLayer() {
        addPulsatingLayer()
        addTrackLayer()
        addStrokeLayer()
    }
    
    func addTrackLayer() {
        let trackLayer = createLayer(strokeColor: .backgroundColorMain, fillColor: .uiControl)
        layer.addSublayer(trackLayer)
    }
    
    func addPulsatingLayer() {
        pulsatingLayer = createLayer(strokeColor: .clear, fillColor: .pulsatingColor)
        layer.addSublayer(pulsatingLayer)
    }
    
    func addStrokeLayer() {
        shapeLayer = createLayer(strokeColor: .backgroundColorUIControl, fillColor: .clear)
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        
        //Rotate layer -90 degrees
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        layer.addSublayer(shapeLayer)
    }
    
    func createLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth
        layer.fillColor = fillColor.cgColor
        layer.position = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        return layer
    }
    
    func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: NRConstants.Animations.transformScaleKeyPath)
        animation.toValue = 1.3
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        pulsatingLayer.add(animation, forKey: NRConstants.Animations.pulsatingAnimationKey)
    }
    
    func animateCircle() {
        let percentage = 1 - (CGFloat(animationCounter) / CGFloat(seconds)) * 0.01
        shapeLayer.strokeEnd = percentage
    }
}
