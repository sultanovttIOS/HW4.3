//
//  ViewController.swift
//  HW4.3
//
//  Created by Alisher Sultanov on 21/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var loginLabel = MakerView.shared.makerLabel(text: "Login", textColor: UIColor.black, font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    
    private lazy var userImage = MakerView.shared.makerImage(image: UIImage(named: "user"), cornerRadius: 0)
    
    private lazy var welcomeLabel = MakerView.shared.makerLabel(text: "Welcome back , Rohit thakur", textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    private lazy var image = MakerView.shared.makerImage(image: UIImage(named: "drawkit"), cornerRadius: 0)
    
    private lazy var mobilNumbLabel = MakerView.shared.makerLabel(text: "Enter Your Mobile Number", textColor: UIColor(red: 0.949, green: 0.475, blue: 0.42, alpha: 1), font: UIFont.systemFont(ofSize: 17, weight: .bold))
    
    private lazy var phonNumberTf: UITextField = {
        let textField = MakerView.shared.makerTf(placeholder: "Enter Number", cornerRadius: 10, backgroundColor: UIColor.white)
        textField.delegate = self
        return textField
    }()
    
    private lazy var changeNumberLabel = MakerView.shared.makerLabel(text: "Change Number ?", textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    private lazy var loginButton = MakerView.shared.makerButton(tintColor: UIColor.white, setTitle: "Login", cornerRadius: 10, backgroundColor: UIColor(red: 0.949, green: 0.475, blue: 0.42, alpha: 1))
    
    private lazy var googleImage = MakerView.shared.makerImage(image: UIImage(named: "google"), cornerRadius: 0)
    
    private lazy var googlabel = MakerView.shared.makerLabel(text: "Google", textColor: UIColor.black, font: UIFont.systemFont(ofSize: 14, weight: .medium))
    
    private lazy var dontHaveLabel = MakerView.shared.makerLabel(text: "You Don’t have an account ?", textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    private lazy var signUpLabel = MakerView.shared.makerLabel(text: "Sign up", textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 12, weight: .semibold))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.backgroundColor = .secondarySystemBackground
        stpLoginLabel()
        stpUserImageView()
        stpWelcomeLabel()
        stpImageView()
        stpMobilNumbLabel()
        stpTf()
        stpChangeNumberLabel()
        stpLoginButton()
        stpGoogleImage()
        stpGoogleLabel()
        stpDontHaveLabel()
        stpSignUpLabel()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let isValidPhoneNumber = newText.hasPrefix("+996") || newText.hasPrefix("996")
        loginButton.isEnabled = isValidPhoneNumber
        return true
    }
    
    private func stpSignUpLabel() {
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.leading.equalTo(dontHaveLabel.snp.trailing).offset(2)
            make.height.equalTo(18)
        }
    }
    
    private func stpDontHaveLabel() {
        view.addSubview(dontHaveLabel)
        dontHaveLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.leading.equalTo(view.snp.leading).offset(93)
            make.height.equalTo(18)
        }
    }
    
    private func stpGoogleLabel() {
        view.addSubview(googlabel)
        googlabel.snp.makeConstraints { make in
            make.centerY.equalTo(googleImage.snp.centerY)
            make.leading.equalTo(googleImage.snp.trailing).offset(8)
            make.height.equalTo(21)
            make.width.equalTo(51)
        }
    }
    private func stpGoogleImage() {
        view.addSubview(googleImage)
        googleImage.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(45)
            make.leading.equalTo(view.snp.leading).offset(160)
            make.height.width.equalTo(21)
        }
    }
    private func stpLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(phonNumberTf.snp.bottom).offset(64)
            make.height.equalTo(43)
            make.width.equalTo(367)
            make.horizontalEdges.equalToSuperview().inset(23)
        }
        loginButton.addTarget(self, action: #selector(showMyContacts), for: .touchUpInside)
    }
    
    @objc func showMyContacts(sender: UIButton) {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    private func stpChangeNumberLabel() {
        view.addSubview(changeNumberLabel)
        changeNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(phonNumberTf.snp.bottom).offset(11)
            make.trailing.equalTo(view.snp.trailing).offset(-41)
            make.width.equalTo(110)
            make.height.equalTo(18)
        }
    }
    
    private func stpTf() {
        view.addSubview(phonNumberTf)
        phonNumberTf.snp.makeConstraints { make in
            make.top.equalTo(mobilNumbLabel.snp.bottom).offset(31)
            make.height.equalTo(43)
            make.horizontalEdges.equalToSuperview().inset(23)
        }
    }
    
    private func stpMobilNumbLabel() {
        view.addSubview(mobilNumbLabel)
        mobilNumbLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(15)
            make.centerX.equalTo(image.snp.centerX)
            make.width.equalTo(228)
            make.height.equalTo(26)
        }
    }
    
    private func stpImageView() {
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(49)
            make.centerX.equalTo(view.snp.centerX)
            make.horizontalEdges.equalToSuperview().inset(59)
        }
    }
    
    private func stpUserImageView() {
        view.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(64)
            make.width.equalTo(20)
            make.height.equalTo(19)
            make.leading.equalTo(loginLabel.snp.trailing).offset(4)
            
        }
    }
    
    private func stpWelcomeLabel() {
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(3)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.width.equalTo(185)
            make.height.equalTo(18)
        }
    }
    
    private func stpLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(62)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.width.equalTo(46)
            make.height.equalTo(23)
        }
    }
}

