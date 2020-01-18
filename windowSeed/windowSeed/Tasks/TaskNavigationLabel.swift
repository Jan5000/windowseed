//
//  TaskSubHeadLabel.swift
//  windowSeed
//
//  Created by Jan Scheffel on 16.01.20.
//  Copyright © 2020 Scheffel, Jan. All rights reserved.
//

import UIKit

class TaskNavigationLabel: UILabel {

       
       
       override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            
        }
       
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setup()
        }
        
        
        func setup() {

           // Aufgaben

            let view = UILabel()
           view.frame = CGRect(x: 0, y: 0, width: 125, height: 31)
           

           view.textColor = UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1)
           view.font = UIFont(name: "HelveticaNeue-Bold", size: 24)

           // Line height: 29 pt

           view.textAlignment = .center
           view.attributedText = NSMutableAttributedString(string: "Aufgaben", attributes: [NSAttributedString.Key.kern: 0.08])

            let parent = self
           parent.addSubview(view)
           view.translatesAutoresizingMaskIntoConstraints = false
           

   
   

}
}
