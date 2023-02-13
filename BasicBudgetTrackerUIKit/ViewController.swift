//
//  ViewController.swift
//  BasicBudgetTrackerUIKit
//
//  Created by Ishaan Bhasin on 2/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum ButtonSelection {
        case plus
        case minus
    }
    
    var currentBudget: Float = 0.0
    var currentSelecttion: ButtonSelection = .plus
    
    var trackerImage = UIImageView()
    var trackerLabel = UILabel()
    var budgetLabel = UILabel()
    var transaction = UILabel()
    var plusButton = UIButton()
    var minusButton = UIButton()
    var transactionLabel1 = UILabel()
    var transactionLabel2 = UILabel()
    var transactionLabel1TextField = UITextField()
    var transactionLabel2TextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        trackerImage.image = UIImage(named: "tracker")
        trackerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackerImage)
        
        trackerLabel.text = "Budget Tracker"
        trackerLabel.font = UIFont(name: "Inter-Bold", size: 32)
        trackerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackerLabel)
        
        budgetLabel.text = "$ \(currentBudget)"
        if currentBudget > 0 {
            budgetLabel.textColor = UIColor(red: 0.251, green: 0.325, blue: 0.98, alpha: 1)
        } else if currentBudget < 0 {
            budgetLabel.textColor = UIColor(red: 0.878, green: 0.443, blue: 0.62, alpha: 1)
        }else {
            budgetLabel.textColor = UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1)
        }
        budgetLabel.font = UIFont(name: "Inter-Bold", size: 24)
        budgetLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(budgetLabel)
        
        transaction.text = "Transaction"
        transaction.textColor = UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1)
        transaction.font = UIFont(name: "Inter-Regular", size: 12)
        transaction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transaction)
        
        
        view.addSubview(plusButton)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = UIFont(name: "Inter-Regular", size: 24)
        plusButton.backgroundColor = UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1)
        plusButton.layer.cornerRadius = 10
        plusButton.layer.borderWidth = 3
        plusButton.layer.borderColor = UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1).cgColor
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = UIFont(name: "Inter-Regular", size: 24)
        minusButton.backgroundColor = UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1)
        minusButton.layer.cornerRadius = 10
        minusButton.layer.borderWidth = 3
        minusButton.layer.borderColor = UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1).cgColor
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        switch currentSelecttion{
        case .plus:
            plusButton.backgroundColor = UIColor(red: 0.251, green: 0.325, blue: 0.98, alpha: 1)
            plusButton.setTitleColor(UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1), for: .normal)
            minusButton.backgroundColor = UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1)
            minusButton.setTitleColor(UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1), for: .normal)
            transactionLabel1.text = "Profit"
            transactionLabel2.text = "Amount"
            transactionLabel1TextField.placeholder = "i.e. pay check, Venmo"
            transactionLabel2TextField.placeholder = "i.e. 5, 3.14"
        case .minus:
            minusButton.backgroundColor = UIColor(red: 0.251, green: 0.325, blue: 0.98, alpha: 1)
            minusButton.setTitleColor(UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1), for: .normal)
            plusButton.backgroundColor = UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1)
            plusButton.setTitleColor(UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1), for: .normal)
            transactionLabel1.text = "Expense"
            transactionLabel2.text = "Cost"
            transactionLabel1TextField.placeholder = "i.e. bills, utility"
            transactionLabel2TextField.placeholder = "i.e. 5, 3.14"
        }
        
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        view.addSubview(minusButton)
        
        transactionLabel1.font = UIFont(name: "Inter-Regular", size: 12)
        transactionLabel1.textColor = UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1)
        transactionLabel2.font = UIFont(name: "Inter-Regular", size: 12)
        transactionLabel2.textColor = UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1)
        transactionLabel1.translatesAutoresizingMaskIntoConstraints = false
        transactionLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transactionLabel1)
        view.addSubview(transactionLabel2)
        
        transactionLabel1TextField.backgroundColor = .black
//        UIColor(red: 0.902, green: 0.914, blue: 0.855, alpha: 1)
        transactionLabel2TextField.backgroundColor = UIColor(red: 0.902, green: 0.914, blue: 0.855, alpha: 1)
        transactionLabel1TextField.layer.cornerRadius = 10
        transactionLabel2TextField.layer.cornerRadius = 10
        view.addSubview(transactionLabel1TextField)
        view.addSubview(transactionLabel2TextField)
        setupConstraints()
    }
    
    
    @objc func plusButtonPressed() {
        switch currentSelecttion{
        case .minus:
            currentSelecttion = .plus
            plusButton.backgroundColor = UIColor(red: 0.251, green: 0.325, blue: 0.98, alpha: 1)
            plusButton.setTitleColor(UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1), for: .normal)
            minusButton.backgroundColor = UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1)
            minusButton.setTitleColor(UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1), for: .normal)
            transactionLabel1.text = "Profit"
            transactionLabel2.text = "Amount"
            transactionLabel1TextField.placeholder = "i.e. pay check, Venmo"
            transactionLabel2TextField.placeholder = "i.e. 5, 3.14"
        default:
            break
        }
    }
    
    @objc func minusButtonPressed(){
        switch currentSelecttion{
        case .plus:
            currentSelecttion = .minus
            minusButton.backgroundColor = UIColor(red: 0.878, green: 0.443, blue: 0.62, alpha: 1)
            minusButton.setTitleColor(UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1), for: .normal)
            plusButton.backgroundColor = UIColor(red: 0.953, green: 0.965, blue: 0.902, alpha: 1)
            plusButton.setTitleColor(UIColor(red: 0.22, green: 0.227, blue: 0.282, alpha: 1), for: .normal)
            transactionLabel1.text = "Expense"
            transactionLabel2.text = "Cost"
            transactionLabel1TextField.placeholder = "i.e. bills, utility"
            transactionLabel2TextField.placeholder = "i.e. 5, 3.14"
        default:
            break
        }
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
        
        NSLayoutConstraint.activate([
            budgetLabel.topAnchor.constraint(equalTo: trackerLabel.bottomAnchor, constant: 18),
            budgetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            transaction.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: 18),
            transaction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: transaction.bottomAnchor, constant: 18),
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: transaction.bottomAnchor, constant: 18),
            minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            minusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            transactionLabel1.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 18),
            transactionLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            transactionLabel2.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 18),
            transactionLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
    }
    
    
}

