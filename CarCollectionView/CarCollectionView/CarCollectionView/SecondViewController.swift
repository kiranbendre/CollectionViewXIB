//
//  SecondViewController.swift
//  CarCollectionView
//
//  Created by Iphone XR on 03/12/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var descriptionLabel = UILabel()
    var descriptionFromFirstVC:String?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "SecondVC"
        
        descriptionLabel.text = carDesc[myIndex]
       
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.sizeToFit()
        descriptionLabel.backgroundColor = UIColor.white
        self.view.addSubview(descriptionLabel)
        //Add Constraint to Label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 150).isActive = true
        NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
       
        
        
        //self.descriptionLabel.text = descriptionFromFirstVC
        
       
    }
   

    

}
