//
//  TimerViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var seconds: Int = 0 {
        didSet {
            timerCounter = seconds
            animationCounter = seconds * 100
        }
    }
    private var timerCounter: Int = 0
    private var animationCounter: Int = 0
    private var timer: Timer?
    private var animationTimer: Timer?
    private var tapGesture: UITapGestureRecognizer!
    private var isShapeLayerSet = false
    private let shapeLayer = CAShapeLayer()
    private var pulsatingLayer: CAShapeLayer?
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .backgroundColorUIControl
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 50)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        view.addGestureRecognizer(tapGesture)
        subscribe()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startTimer()
    }
    
    func setup() {
        setupLayout()
        setupDesign()
    }
    
    private func setupDesign() {
       view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
    }
    
    private func updateLayout() {
        timerLabel.text = "\(timerCounter)"
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        animationTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(handleAnimationTimer), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        
        animationTimer?.invalidate()
        animationTimer = nil
    }
    
    @objc private func handleTimer() {
        if timerCounter == 0 {
            stopTimer()
            return
        }
        
        timerCounter -= 1
        updateLayout()
    }
    
    @objc private func handleAnimationTimer() {
        if animationCounter == 0 {
            stopTimer()
            return
        }
        animationCounter -= 1
        animatePulsatingLayer()
    }
    
    @objc private func dismissViewController() {
        dismiss(animated: true)
    }
    
    deinit {
        stopTimer()
        unsubscribe()
        view.removeGestureRecognizer(tapGesture)
        print("Deinit")
    }
}

extension TimerViewController {
    
    private func setupLayout() {
        setupTimerLabel()
        
        setupShapeLayer()
    }
    
    private func setupTimerLabel() {
        view.addSubview(timerLabel)
        
        timerLabel.text = "\(timerCounter)"
        timerLabel.centerInSuperview(size: CGSize(width: 100, height: 100))
    }
    
    private func setupShapeLayer() {
        let center = view.center
        let lineWidth: CGFloat = 20
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        //layer below
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.backgroundColorUIControl.cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.position = center
        view.layer.addSublayer(trackLayer)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer?.path = circularPath.cgPath
        pulsatingLayer?.strokeColor = UIColor.clear.cgColor
        pulsatingLayer?.lineWidth = lineWidth
        pulsatingLayer?.fillColor = UIColor.yellow.cgColor
        pulsatingLayer?.position = center
        view.layer.addSublayer(pulsatingLayer!)
        
       
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.uiControl.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.position = center
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        
        //Rotate layer -90 degrees
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        animatePulsatingLayer()
        view.layer.addSublayer(shapeLayer)
        
    }
    
    private func addTrackLayer() {
    
    }
    
    private func addStrokeLayer() {
        
    }
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 5
        pulsatingLayer!.add(animation, forKey: "pulsing")
    }
    
    private func animateCircle() {
        let percentage = 1 - (CGFloat(animationCounter) / CGFloat(seconds)) * 0.01
        shapeLayer.strokeEnd = percentage
    }
}
