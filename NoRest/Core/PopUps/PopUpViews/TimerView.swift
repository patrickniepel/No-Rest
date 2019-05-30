//
//  TimerView.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    weak var delegate: PopUpDelegate?
    
    private var seconds: Int = 0
    private var timerCounter: Int = 0
    private var animationCounter: Int = 0
    private var timer: Timer?
    private var animationTimer: Timer?
    
    private var shapeLayer: CAShapeLayer!
    private var pulsatingLayer: CAShapeLayer!
    private let lineWidth: CGFloat = 20
    private lazy var circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
    private lazy var centerPoint: CGPoint = {
        return CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .backgroundColorUIControl
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 50)
        return label
    }()

    convenience init(seconds: Int) {
        self.init()
        self.seconds = seconds
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    private func setup() {
        timerCounter = seconds
        animationCounter = seconds * 100
        setupLayout()
        setupDesign()
    }
    
    private func setupDesign() {
        backgroundColor = .clear
    }
    
    private func updateLayout() {
        timerLabel.text = "\(timerCounter)"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        animationTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(handleAnimationTimer), userInfo: nil, repeats: true)
        animatePulsatingLayer()
    }
    
    private func stopTimers() {
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
            AudioPlayer.playTimerSound()
            delegate?.timerDidEnd()
            return
        }
        
        timerCounter -= 1
        updateLayout()
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

extension TimerView {
    
    private func setupLayout() {
        setupShapeLayer()
        setupTimerLabel()
    }
    
    private func setupTimerLabel() {
        addSubview(timerLabel)
        
        timerLabel.text = "\(timerCounter)"
        timerLabel.centerInSuperview(size: CGSize(width: 100, height: 100))
    }
    
    private func setupShapeLayer() {
        addPulsatingLayer()
        addTrackLayer()
        addStrokeLayer()
    }
    
    private func addTrackLayer() {
        let trackLayer = createLayer(strokeColor: .backgroundColorMain, fillColor: .uiControl)
        layer.addSublayer(trackLayer)
    }
    
    private func addPulsatingLayer() {
        pulsatingLayer = createLayer(strokeColor: .clear, fillColor: .pulsatingColor)
        layer.addSublayer(pulsatingLayer)
    }
    
    private func addStrokeLayer() {
        shapeLayer = createLayer(strokeColor: .backgroundColorUIControl, fillColor: .clear)
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        
        //Rotate layer -90 degrees
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        layer.addSublayer(shapeLayer)
    }
    
    private func createLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth
        layer.fillColor = fillColor.cgColor
        layer.position = centerPoint
        return layer
    }
    
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: NRConstants.Animations.transformScaleKeyPath)
        animation.toValue = 1.3
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        pulsatingLayer.add(animation, forKey: NRConstants.Animations.pulsatingAnimationKey)
    }
    
    private func animateCircle() {
        let percentage = 1 - (CGFloat(animationCounter) / CGFloat(seconds)) * 0.01
        shapeLayer.strokeEnd = percentage
    }
}
