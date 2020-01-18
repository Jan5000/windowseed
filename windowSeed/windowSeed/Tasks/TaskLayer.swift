//
//  TaskLayer.swift
//  windowSeed
//
//  Created by Jan Scheffel on 11.01.20.
//  Copyright © 2020 Scheffel, Jan. All rights reserved.
//

import UIKit

class TaskLayer: UIView {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTaskLayer()
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTaskLayer()
    }
    
    
    func setupTaskLayer () {
        
        //change background in inspector to default
        //change all var to let
         
        let view = UILabel()
    view.frame = CGRect(x: 0, y: 0, width: 165, height: 135)
    //comment this out
    //view.backgroundColor = .white
    
    
        let shadows = UIView()
    shadows.frame = view.frame
    shadows.clipsToBounds = false
    view.addSubview(shadows)
    
    let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
    let layer0 = CALayer()
    layer0.shadowPath = shadowPath0.cgPath
    layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
    layer0.shadowOpacity = 1
    layer0.shadowRadius = 12
    layer0.shadowOffset = CGSize(width: 0, height: 0)
    layer0.bounds = shadows.bounds
    layer0.position = shadows.center
    shadows.layer.addSublayer(layer0)
    
        let shapes = UIView()
    shapes.frame = view.frame
    shapes.clipsToBounds = true
    view.addSubview(shapes)
    
    let layer1 = CALayer()
    layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    layer1.bounds = shapes.bounds
    layer1.position = shapes.center
    shapes.layer.addSublayer(layer1)
    
    shapes.layer.cornerRadius = 10
    
        //change to self
        let parent = self
    parent.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints =  false
    view.widthAnchor.constraint(equalToConstant: 165).isActive = true
    view.heightAnchor.constraint(equalToConstant: 135).isActive = true
    //delete the position restraints
}
}
