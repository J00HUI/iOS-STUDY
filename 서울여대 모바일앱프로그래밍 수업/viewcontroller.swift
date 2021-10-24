//  ViewController.swift


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var loginUserID: UITextField!
    @IBOutlet var loginPasswd: UITextField!
    @IBOutlet var loginStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginUserID {
            loginUserID.becomeFirstResponder()
            loginPasswd.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func Login(_ sender: UIButton) {
        if loginUserID.text == "" {
            loginStatus.text = "ID 를 입력하세요. "
            return
        }
        if loginPasswd.text == "" {
            loginStatus.text = "비밀번호 를 입력하세요."
            return
        }
        
        let urlString: String = "http://localhost:8888/login/loginUser2.php"
        guard let requestURL = URL(string: urlString) else {
            return
        }
        self.loginStatus.text = ""
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        let restString = "id=" + loginUserID.text! + "&password=" + loginPasswd.text!
        request.httpBody = restString.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request){
            (responseData, response, responseError) in
            
            guard responseError == nil else {
                print(("Error: calling POST"))
                return
            }
            
            guard let receiveData = responseData else{
                print("Error: not receiving Data")
                return
            }
            
            do {
                let response = response as! HTTPURLResponse
                
                if !(200...299 ~= response.statusCode){
                    print("HTTP Error!")
                    return
                }
                
                guard let jsonData = try JSONSerialization.jsonObject(with: receiveData, options: .allowFragments) as? [String : Any] else {
                    print("JSON Serialization Error!")
                    return
                }
                
                guard let success = jsonData["success"] as? String else {
                    print("Error: PHP failure(success)")
                    return
                }
                
                if success == "YES" {
                    if let name = jsonData["name"] as? String {
                        DispatchQueue.main.async {
                            self.loginStatus.text = name + "님 안녕하세요?"
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.ID = self.loginUserID.text
                            appDelegate.userName = name
                            self.performSegue(withIdentifier: "toLoginSuccess", sender: self)
                        }
                    }
                } else {
                    if let errMessage = jsonData["error"] as? String {
                        DispatchQueue.main.async {
                            self.loginStatus.text = errMessage
                        }
                    }
                }
            } catch {
                print("Error: \(error)")
            }

        }
        task.resume()
        
    }
    
}

