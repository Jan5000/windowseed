//
//  TaskHeaderLabel.swift
//  windowSeed
//
//  Created by Jan Scheffel on 16.01.20.
//  Copyright © 2020 Scheffel, Jan. All rights reserved.
//

import UIKit

class TaskHeaderLabel: UILabel {

    // Gießen
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
         
     }
    
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setup()
     }
     
     
     func setup() {

        let view = UILabel()
    view.frame = CGRect(x: 0, y: 0, width: 126, height: 21)
    

    view.textColor = UIColor(red: 0.166, green: 0.166, blue: 0.166, alpha: 1)
    view.font = UIFont(name: "HelveticaNeue-Bold", size: 16)

    // Line height: 19 pt

    view.text = "Aufgabe"

        let parent = self
    parent.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false

}
}
