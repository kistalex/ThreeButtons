//
//
// ThreeButtons
// CustomButton.swift
// 
// Created by Alexander Kist on 04.07.2023.
//


import UIKit

class CustomButton: UIButton {
    
    let iconImageView = UIImageView()
    let contentInsets =  UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
    let titleInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
    let imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)
    
    init(title: String?, icon: UIImage?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        iconImageView.image = icon
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        contentEdgeInsets = contentInsets
        titleEdgeInsets = titleInsets
        imageEdgeInsets = imageInsets
        addSubview(iconImageView)
        sizeToFit()
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        let titleSize = titleLabel?.sizeThatFits(CGSize(width: bounds.width, height: bounds.height)) ?? CGSize.zero
        let iconSize = iconImageView.image?.size ?? CGSize.zero
        let spacing = titleSize.width > 0 && iconSize.width > 0 ? titleInsets.right : 0
        let totalWidth = titleSize.width + spacing + iconSize.width
        let titleX = (bounds.width - totalWidth) / 2
        let iconX = titleX + titleSize.width + spacing
        titleLabel?.frame.origin.x = titleX
        iconImageView.frame = CGRect(x: iconX, y: (bounds.height - iconSize.height) / 2, width: iconSize.width, height: iconSize.height)
    }
    
    override var isHighlighted: Bool {
        didSet {
            let transform: CGAffineTransform = isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                self.transform = transform
            }, completion: nil)
        }
    }
    


}
