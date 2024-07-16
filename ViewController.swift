import UIKit
import LocalAuthentication


class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { succes, error in
                if succes == true{
                    // succesfull auth
                    DispatchQueue.main.async{
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else{
                    DispatchQueue.main.async{
                        self.myLabel.text = "Error!"
                    }
                }
            }
        }
    }
}

