import Foundation
import UIKit
class LoginVC: UIViewController {
    
    @IBOutlet weak var StartUpBlur: UIVisualEffectView!
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var BackgroundImage2: UIImageView!
    @IBOutlet weak var BackgroundImage3: UIImageView!
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var CreateAccountButton: UIButton!
    
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var WelcomeScreen: UIView!
    @IBOutlet weak var LoginScreen: UIView!
    @IBOutlet weak var IncorrectMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartUpBlur.frame = CGRect(x: 0, y: 0, width: view.center.x*2, height: view.center.y*2)
        BackgroundImage.frame = CGRect(x: view.center.x - view.center.y*2, y: view.center.y * -1, width: view.center.y*4, height: view.center.y*4)
        BackgroundImage2.frame = CGRect(x: view.center.x - view.center.y*2, y: view.center.y * -1, width: view.center.y*4, height: view.center.y*4)
        BackgroundImage3.frame = CGRect(x: view.center.x - view.center.y*2, y: view.center.y * -1, width: view.center.y*4, height: view.center.y*4)
        BackgroundImage.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
        BackgroundImage2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
        BackgroundImage3.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
        BackgroundImage.alpha = CGFloat.random(in: 0..<0.5)
        BackgroundImage2.alpha = CGFloat.random(in: 0..<0.5)
        BackgroundImage3.alpha = CGFloat.random(in: 0.5..<1)
        backgroundRotate()
        WelcomeScreen.frame = CGRect(x: self.view.center.x - 187, y: self.view.center.y * 2 + 250, width: 375, height: 186)
        LoginScreen.frame = CGRect(x: self.view.center.x - 187, y: self.view.center.y * 2 + 250, width: 375, height: 182)
        UIView.animate(withDuration: 1, animations: {
            self.WelcomeScreen.frame = CGRect(x: self.view.center.x - 187, y: self.view.center.y - 93, width: 375, height: 186)
        })
    }
    
    func backgroundRotate(){
        UIView.animate(withDuration: 3, animations: {
            self.BackgroundImage.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
            self.BackgroundImage2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
            self.BackgroundImage3.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
            self.BackgroundImage.alpha = CGFloat.random(in: 0..<1)
            self.BackgroundImage2.alpha = CGFloat.random(in: 0..<1)
            self.BackgroundImage3.alpha = CGFloat.random(in: 0..<1)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.backgroundRotate()
        }
    }
    
    @IBAction func SignIn(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.WelcomeScreen.frame = CGRect(x: self.view.center.x - 187, y: -250, width: 375, height: 186)
            self.LoginScreen.frame = CGRect(x: self.view.center.x - 187, y: self.view.center.y - 150, width: 375, height: 182)
        })
    }
    
    @IBAction func Back(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.WelcomeScreen.frame = CGRect(x: self.view.center.x - 187, y: self.view.center.y - 93, width: 375, height: 186)
            self.LoginScreen.frame = CGRect(x: self.view.center.x - 187, y: self.view.center.y * 2 + 250, width: 375, height: 182)
            
        })
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    @IBAction func Next(_ sender: UIButton) {
        if(UsernameField.text == "admin"){
            performSegue(withIdentifier: "loginToHomepage", sender: nil)
        }else{
            IncorrectMessage.alpha = 1
            UIView.animate(withDuration: 5, animations: {
                self.IncorrectMessage.alpha = 0
            })
        }
    }
    
}

