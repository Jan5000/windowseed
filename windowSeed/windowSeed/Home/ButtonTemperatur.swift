//
//  ButtonTemperatur.swift
//  windowSeed
//
//  Created by Scheffel, Jan on 18.12.19.
//  Copyright © 2019 Scheffel, Jan. All rights reserved.
//

import UIKit

class ButtonTemperatur: UIButton  {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        
    }
    
    func setupButton () {
        setShadow()
        setTitleColor(.white, for: .normal)
        
        
        
        backgroundColor = .white
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont(name: "", size: 16)
        layer.cornerRadius = 37
        
        
    }
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius  = 10
        layer.shadowOpacity = 0.1
        clipsToBounds       = true
        layer.masksToBounds = false
        
    }
    
    
    
}
