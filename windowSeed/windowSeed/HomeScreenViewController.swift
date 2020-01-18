//
//  HomeScreenViewController.swift
//  windowSeed
//
//  Created by Scheffel, Jan on 18.12.19.
//  Copyright © 2019 Scheffel, Jan. All rights reserved.
//

import UIKit
import MBCircularProgressBar


//structure from json data
struct Raspberry: Decodable {
    let feeds: [Feeds]?
}
struct Feeds: Decodable {
    let field1: String?
    let field2: String?
    
}

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var toggle: UISwitch!
    var transparentView = UIView()
    var tableView = UITableView()
    let heightTable: CGFloat = 500
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllRooms()
//fetch json data from api url__________
        print("t")
        let urlString = "https://api.thingspeak.com/channels/952363/feeds.json?api_key=G61QYBO1YJHZHAZ2"
       guard let gitUrl = URL(string: "https://api.thingspeak.com/channels/952363/feeds.json?api_key=G61QYBO1YJHZHAZ2") else { return }
        
        URLSession.shared.dataTask(with: gitUrl) {(data, response, error) in
            
            
            do {
                guard let data = data else { return }
                do {
                   let decoder = JSONDecoder()
                    let gitData = try decoder.decode(Raspberry.self, from: data)
                    print("test")
                    print(gitData.feeds![0])
                //for temp in data {
                    //print(temp.feeds)
                //}
                print(data)
                
            } catch let err {
            print("Err", err)
                
            }
            
            }}
        
 
//_______________________________________
       

        // Do any additional setup after loading the view.
    }
    enum JSONError: String, Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
   
    // With URLSession
    public func fetchAllRooms() {
    
        let urlPath = "https://api.thingspeak.com/channels/952363/feeds.json?api_key=G61QYBO1YJHZHAZ2"
        guard let endpoint = URL(string: urlPath) else {
            print("Error creating endpoint")
            return
        }
        URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                    else {
                    throw JSONError.ConversionFailed
                }
                let decoder = JSONDecoder()
                let raspberrydata = try decoder.decode(Raspberry.self, from: data)
                print(raspberrydata)
                
                print(json)
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }.resume()
    

    }
    
    @IBAction func SlideTemperatur(_ sender: Any) {
        
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        transparentView.frame = self.view.frame
        self.view.addSubview(transparentView)
        
        //bildschirmgröße
        let screensize = UIScreen.main.bounds.size
        
        //slider definieren
        tableView.frame = CGRect(x: 0, y: screensize.height, width: screensize.width, height: heightTable)
        //slider einfügen
        self.view.addSubview(tableView)
        
        
        
        
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tabGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: { self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: screensize.height - self.heightTable, width: screensize.width, height: self.heightTable)
        }, completion: nil)

    
        
    }
    
    //zurücksetzen
    @objc func onClickTransparentView() {
        let screensize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screensize.height, width: screensize.width, height: self.heightTable)
        }, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
