//
//
// ThreeButtons
// ViewController.swift
// 
// Created by Alexander Kist on 04.07.2023.
//


import UIKit

class ViewController: UIViewController {
    
    private var isModalPresented: Bool = false
    
    private let firstButton = CustomButton(title: "First Button", icon: UIImage(systemName: "arrow.forward.circle.fill"))
    private let secondButton = CustomButton(title: "Second Medium Button", icon: UIImage(systemName: "arrow.forward.circle.fill"))
    private let thirdButton = CustomButton(title: "Third", icon: UIImage(systemName: "arrow.forward.circle.fill"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews(){
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        thirdButton.addTarget(self, action: #selector(showModalController), for: .touchUpInside)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func showModalController() {
        let modalController = ModalViewController()
        modalController.view.backgroundColor = .red
        modalController.modalPresentationStyle = .pageSheet
        if let sheet = modalController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .large
        }
        
        
        present(modalController, animated: true) {
            self.firstButton.backgroundColor = .gray
            self.secondButton.backgroundColor = .gray
            self.thirdButton.backgroundColor = .gray
            
            modalController.dismissCompletion = {
                self.firstButton.backgroundColor = .systemBlue
                self.secondButton.backgroundColor = .systemBlue
                self.thirdButton.backgroundColor = .systemBlue
            }
        }
    }
}
    

