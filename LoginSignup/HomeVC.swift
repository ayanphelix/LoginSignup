//
//  HomeVC.swift
//  LoginSignup
//
//  Created by Ayanbola Felix on 08/04/2018.
//  Copyright © 2018 Ayanbola Felix. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let componentView : UIView = {
        let view = UIView()
//        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailImageView : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "email-60").withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)])
        tf.textColor = .white
        tf.tintColor = .white
        tf.setBottomBorder(backgroundColor: UIColor.backgroundColor, borderColor: .white)
        return tf
    }()
    
    let passwordImageView : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "password").withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)])
        tf.textColor = .white
        tf.tintColor = .white
        tf.isSecureTextEntry = true
        tf.setBottomBorder(backgroundColor: UIColor.backgroundColor, borderColor: .white)
        return tf
    }()
    
    let usernameImageView : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "username").withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let usernameTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)])
        tf.textColor = .white
        tf.tintColor = .white
        tf.setBottomBorder(backgroundColor: UIColor.backgroundColor, borderColor: .white)
        return tf
    }()
    
    let phoneImageView : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "phone-Small-40").withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let phoneTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)])
        tf.textColor = .white
        tf.tintColor = .white
        tf.setBottomBorder(backgroundColor: UIColor.backgroundColor, borderColor: .white)
        return tf
    }()
    
    let addressImageView : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "email-60").withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let addresssTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Address", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        tf.textColor = .white
        tf.tintColor = .white
        tf.setBottomBorder(backgroundColor: UIColor.backgroundColor, borderColor: .white)
        return tf
    }()
    
    lazy var registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("REGISTER", for: .normal)
        button.setTitleColor(Service.buttonTitleColor, for: .normal)
        button.backgroundColor = Service.primaryDarkColor
        button.titleLabel?.font = Service.buttonFontSize
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Service.buttonCornerRadius
        button.addTarget(self, action: #selector(handleRegsiterButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        setupView()
    }
    
    @objc fileprivate func handleRegsiterButton(){
        print("register here")
    }
    
    fileprivate func setupView(){
        view.addSubview(componentView)
        
        componentView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        componentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
        
        setupTextFieldsStactView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    fileprivate func setupTextFieldsStactView(){
        let emailView = UIView()
        
        let passwordView = UIView()
        
        let usernameView = UIView()
        
        let phoneView = UIView()
        
        let addressView = UIView()
        
        let fieldsStackView = UIStackView(arrangedSubviews: [emailView,passwordView,usernameView,phoneView,addressView])
        fieldsStackView.distribution = .fillEqually
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 8
        fieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        componentView.addSubview(fieldsStackView)
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailTextField)
        passwordView.addSubview(passwordImageView)
        passwordView.addSubview(passwordTextField)
        usernameView.addSubview(usernameImageView)
        usernameView.addSubview(usernameTextField)
        phoneView.addSubview(phoneImageView)
        phoneView.addSubview(phoneTextField)
        addressView.addSubview(addressImageView)
        addressView.addSubview(addresssTextField)
        
        fieldsStackView.anchor(top: componentView.topAnchor, leading: componentView.leadingAnchor, trailing: componentView.trailingAnchor, bottom: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 0))
        fieldsStackView.heightAnchor.constraint(equalTo: componentView.heightAnchor, multiplier: 0.60).isActive = true
        
        emailImageView.anchor(top: nil, leading: emailView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        emailImageView.centerYAnchor.constraint(equalTo: emailView.centerYAnchor).isActive = true
        
        emailTextField.anchor(top: emailView.topAnchor, leading: emailImageView.trailingAnchor, trailing: emailView.trailingAnchor, bottom: emailView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        passwordImageView.anchor(top: nil, leading: passwordView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        passwordImageView.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor).isActive = true
        
        passwordTextField.anchor(top: passwordView.topAnchor, leading: passwordImageView.trailingAnchor, trailing: passwordView.trailingAnchor, bottom: passwordView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        usernameImageView.anchor(top: nil, leading: usernameView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        usernameImageView.centerYAnchor.constraint(equalTo: usernameView.centerYAnchor).isActive = true
        
        usernameTextField.anchor(top: usernameView.topAnchor, leading: usernameImageView.trailingAnchor, trailing: usernameView.trailingAnchor, bottom: usernameView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        phoneImageView.anchor(top: nil, leading: phoneView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        phoneImageView.centerYAnchor.constraint(equalTo: phoneView.centerYAnchor).isActive = true
        
        phoneTextField.anchor(top: phoneView.topAnchor, leading: phoneImageView.trailingAnchor, trailing: phoneView.trailingAnchor, bottom: phoneView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        addressImageView.anchor(top: nil, leading: addressView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        addressImageView.centerYAnchor.constraint(equalTo: addressView.centerYAnchor).isActive = true
        
        addresssTextField.anchor(top: addressView.topAnchor, leading: addressImageView.trailingAnchor, trailing: addressView.trailingAnchor, bottom: addressView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        componentView.addSubview(registerButton)
        
        registerButton.anchor(top: fieldsStackView.bottomAnchor, leading: componentView.leadingAnchor, trailing: componentView.trailingAnchor, bottom: nil, padding: .init(top: 20, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
    }
    
    
}










