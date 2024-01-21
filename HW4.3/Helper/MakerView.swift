//
//  MakerView.swift
//  HW4.3
//
//  Created by Alisher Sultanov on 21/1/24.
//

import UIKit

class MakerView {
    
    static let shared = MakerView()
    
    func makerStackView(axis: NSLayoutConstraint.Axis,
                        backgroundColor: UIColor,
                        cornerRadius: CGFloat,
                        spacing: CGFloat,
                        distribution: UIStackView.Distribution) -> UIView {
        let view = UIStackView()
        view.axis = axis
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.spacing = spacing
        view.distribution = distribution
        return view
    }
    
    func makerView(backgroundColor: UIColor,
                   cornerRadius: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
    func makerTf(placeholder: String,
                 textColor: UIColor = .black, leftViewMode: UITextField.ViewMode = .always, cornerRadius: CGFloat, backgroundColor: UIColor) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = textColor
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 4))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        return tf
    }
    
    func makerLabel(text: String,
                    textColor: UIColor,
                    font: UIFont,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }
    
    func makerImage(image: UIImage?,
                    contentMode: UIView.ContentMode = .scaleAspectFill,
                    clipsToBounds: Bool = true,
                    cornerRadius: CGFloat) -> UIImageView {
        let view = UIImageView()
        view.image = image ?? UIImage(named: "")
        view.contentMode = contentMode
        view.clipsToBounds = clipsToBounds
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    func makerButton(tintColor: UIColor,
                     setTitle: String,
                     for state: UIControl.State = .normal,
                     cornerRadius: CGFloat,
                     backgroundColor: UIColor,
                     isEnabled: Bool = false) -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = tintColor
        button.setTitle(setTitle, for: state)
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = backgroundColor
        button.isEnabled = isEnabled
        return button
    }
}
