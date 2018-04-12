//
//  LoginVC.swift
//  LoginSignup
//
//  Created by Ayanbola Felix on 11/04/2018.
//  Copyright © 2018 Ayanbola Felix. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var componentViewBottonConstrait : NSLayoutConstraint?
    
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
        tf.textColor = .primaryTextColor
        tf.tintColor = .white
        tf.keyboardType = .emailAddress
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
        tf.textColor = .primaryTextColor
        tf.tintColor = .white
        tf.isSecureTextEntry = true
        tf.setBottomBorder(backgroundColor: UIColor.backgroundColor, borderColor: .white)
        return tf
    }()
    
    lazy var loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(Service.buttonTitleColor, for: .normal)
        button.backgroundColor = UIColor.buttonBackgroundColor
        button.titleLabel?.font = Service.buttonFontSize
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Service.buttonCornerRadius
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotPasswordButton : UIButton = {
    let button = UIButton()
    let attributedTitle = NSMutableAttributedString(string: "Forgot your password?", attributes: [NSAttributedStringKey.foregroundColor : UIColor.buttonLightColor, NSAttributedStringKey.font : Service.buttonFontSize])
    attributedTitle.append(NSAttributedString(string: " Get it here", attributes: [NSAttributedStringKey.foregroundColor : Service.buttonTitleColor, NSAttributedStringKey.font : Service.buttonFontSize]))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(handleForgotPasswordButton), for: .touchUpInside)
    return button
    }()
    
    lazy var gotoRegisterButton : UIButton = {
        let button = UIButton()
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?", attributes: [NSAttributedStringKey.foregroundColor : UIColor.buttonLightColor, NSAttributedStringKey.font : Service.buttonFontSize])
        attributedTitle.append(NSAttributedString(string: " Register", attributes: [NSAttributedStringKey.foregroundColor : Service.buttonTitleColor, NSAttributedStringKey.font : Service.buttonFontSize]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGotoRegisterButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        setupView()
        navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc fileprivate func handleGotoRegisterButton(){
        let registerVC = RegisterVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc fileprivate func handleLoginButton(){
        print("Login here")
    }
    
    @objc fileprivate func handleForgotPasswordButton(){
        let forgotPasswordVC = ForgotPasswordVC()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    @objc func handleKeyboardNotification(notification: NSNotification){
        
        if let userInfo = notification.userInfo{
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey]) as! NSValue
            let keyboardDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey]as! NSValue
            
            let iskeyboardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            componentViewBottonConstrait?.constant = iskeyboardShowing ? -keyboardFrame.cgRectValue.height : 0
            
            UIView.animate(withDuration: keyboardDuration as! TimeInterval, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                
                self.view.layoutIfNeeded()
                
            }, completion: { (completed) in
                
            })
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    fileprivate func setupView(){
        view.addSubview(componentView)
        
        componentView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil)
        componentViewBottonConstrait = componentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        componentViewBottonConstrait?.isActive = true
        componentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40).isActive = true
        
        setupTextFieldsStactView()
    }
    
    fileprivate func setupTextFieldsStactView(){
        let emailView = UIView()
        let passwordView = UIView()
        
        let fieldsStackView = UIStackView(arrangedSubviews: [emailView,passwordView])
        fieldsStackView.distribution = .fillEqually
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 8
        fieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        componentView.addSubview(fieldsStackView)
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailTextField)
        passwordView.addSubview(passwordImageView)
        passwordView.addSubview(passwordTextField)
        
        
        fieldsStackView.anchor(top: componentView.topAnchor, leading: componentView.leadingAnchor, trailing: componentView.trailingAnchor, bottom: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 0))
        fieldsStackView.heightAnchor.constraint(equalTo: componentView.heightAnchor, multiplier: 0.30).isActive = true
        
        emailImageView.anchor(top: nil, leading: emailView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        emailImageView.centerYAnchor.constraint(equalTo: emailView.centerYAnchor).isActive = true
        
        emailTextField.anchor(top: emailView.topAnchor, leading: emailImageView.trailingAnchor, trailing: emailView.trailingAnchor, bottom: emailView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        passwordImageView.anchor(top: nil, leading: passwordView.leadingAnchor, trailing: nil, bottom: nil, padding: .zero, size: .init(width: 30, height: 30))
        passwordImageView.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor).isActive = true
        
        passwordTextField.anchor(top: passwordView.topAnchor, leading: passwordImageView.trailingAnchor, trailing: passwordView.trailingAnchor, bottom: passwordView.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
        
        componentView.addSubview(loginButton)
        loginButton.anchor(top: fieldsStackView.bottomAnchor, leading: componentView.leadingAnchor, trailing: componentView.trailingAnchor, bottom: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        componentView.addSubview(forgotPasswordButton)
        forgotPasswordButton.anchor(top: loginButton.bottomAnchor, leading: componentView.leadingAnchor, trailing: componentView.trailingAnchor, bottom: nil, padding: .init(top: 10, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 40))
        
        componentView.addSubview(gotoRegisterButton)
        gotoRegisterButton.anchor(top: nil, leading: componentView.leadingAnchor, trailing: componentView.trailingAnchor, bottom: componentView.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 40))
    }

}










