import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var StartUpBlur: UIVisualEffectView!
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var BackgroundImage2: UIImageView!
    @IBOutlet weak var BackgroundImage3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        StartUpBlur.frame = CGRect(x: 0, y: 0, width: view.center.x*2, height: view.center.y*2)
        BackgroundImage.frame = CGRect(x: view.center.x - view.center.y, y: 0, width: view.center.y*2, height: view.center.y*2)
        BackgroundImage2.frame = CGRect(x: view.center.x - view.center.y, y: 0, width: view.center.y*2, height: view.center.y*2)
        BackgroundImage3.frame = CGRect(x: view.center.x - view.center.y, y: 0, width: view.center.y*2, height: view.center.y*2)
        BackgroundImage.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
        BackgroundImage2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
        BackgroundImage3.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0..<360))
        BackgroundImage.alpha = CGFloat.random(in: 0..<1)
        BackgroundImage2.alpha = CGFloat.random(in: 0..<1)
        BackgroundImage3.alpha = CGFloat.random(in: 0..<1)
        backgroundRotate()
    }


    @IBAction func SignIn(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.StartUpBlur.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.StartUpBlur.isHidden = true
        }
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
}

