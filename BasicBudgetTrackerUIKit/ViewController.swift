//
//  ViewController.swift
//  BasicBudgetTrackerUIKit
//
//  Created by Ishaan Bhasin on 2/12/23.
//

import UIKit

class ViewController: UIViewController {

    var trackerImage = UIImageView()
    var trackerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        trackerImage.image = UIImage(named: "tracker")
        trackerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackerImage)
        
        
        trackerLabel.text = "Budget Tracker"
        trackerLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        trackerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackerLabel)
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            trackerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            trackerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            trackerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            trackerImage.heightAnchor.constraint(equalToConstant: 225)
        ])
        
        NSLayoutConstraint.activate([
           trackerLabel.topAnchor.constraint(equalTo: trackerImage.bottomAnchor, constant: 18),
           trackerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }


}

