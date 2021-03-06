//
//  CircleView.swift
//  CircularProgressView
//
//  Created by logesh on 1/21/20.
//  Copyright © 2020 logesh. All rights reserved.
//

import Foundation
import UIKit

class UICircularProgressView: UIView {
    
    var backgroundCircleColor: UIColor = .black {
        didSet {
            backgroundCircle.strokeColor = backgroundCircleColor.cgColor
        }
    }
    var fillColor: UIColor = .white {
        didSet {
            progressCircle.strokeColor = fillColor.cgColor
        }
    }
    var lineWidth: CGFloat = 4 {
        didSet {
            backgroundCircle.lineWidth = lineWidth
            progressCircle.lineWidth = lineWidth
        }
    }
    var defaultProgress: CGFloat = 0 {
        didSet {
            updateProgress(progress: defaultProgress)
        }
    }
    
    private var backgroundCircle: CAShapeLayer!
    private var progressCircle: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        drawBackgroundCircle()
        drawProgressCircle()
    }
    
    private func drawBackgroundCircle() {
        backgroundCircle = CAShapeLayer()
        let centerPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius: CGFloat = self.bounds.width / 2
        let circlePath = UIBezierPath(arcCenter: centerPoint,
                                      radius: circleRadius,
                                      startAngle: CGFloat(-0.5 * .pi),
                                      endAngle: CGFloat(1.5 * .pi),
                                      clockwise: true)
        backgroundCircle.path = circlePath.cgPath
        backgroundCircle.strokeColor = UIColor.green.cgColor
        backgroundCircle.fillColor = UIColor.clear.cgColor
        backgroundCircle.lineWidth = 10
        backgroundCircle.lineCap = .round
        backgroundCircle.lineJoin = .round
        backgroundCircle.strokeStart = 0
        backgroundCircle.strokeEnd = 1.0
        self.layer.addSublayer(backgroundCircle)
    }
    
    private func drawProgressCircle() {
        progressCircle = CAShapeLayer()
        let centerPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius: CGFloat = self.bounds.width / 2
        let circlePath = UIBezierPath(arcCenter: centerPoint,
                                      radius: circleRadius,
                                      startAngle: CGFloat(-0.5 * .pi),
                                      endAngle: CGFloat(1.5 * .pi),
                                      clockwise: true)
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = UIColor.red.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 10
        progressCircle.lineCap = .round
        progressCircle.lineJoin = .round
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = 0.0
        self.layer.addSublayer(progressCircle)
        updateProgress(progress: 68)
    }
    
    func updateProgress(progress: CGFloat) {
        progressCircle.strokeEnd = CGFloat(progress / 100)
    }
}
