//
//
// ThreeButtons
// ModalViewController.swift
// 
// Created by Alexander Kist on 05.07.2023.
//


import UIKit

class ModalViewController: UIViewController {
    
    var dismissCompletion: (() -> Void)?
    
    override func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: animated, completion: {
            self.dismissCompletion?()
            completion?()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
