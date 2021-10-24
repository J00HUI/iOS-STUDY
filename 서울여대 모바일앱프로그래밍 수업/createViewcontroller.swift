//  CreateViewController.swift
//  ServerLogin
//
//  Created by 이주희 on 2021/10/11.

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textID: UITextField!
    @IBOutlet var textPasswd: UITextField!
    @IBOutlet var textName: UITextField!
    @IBOutlet var labelStatus: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textID {
            textID.resignFirstResponder()
            textPasswd.becomeFirstResponder()
        }else if textField == self.textPasswd {
            textPasswd.resignFirstResponder()
            textName.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBAction func btnSave(_ sender: UIButton) {
        if textID.text == ""{
            labelStatus.text = "ID 를 입력하세요."
            return
        }
        if textPasswd.text == "" {
            labelStatus.text = "비밀번호 를 입력하세요."
            return
        }
        if textName.text == "" {
            labelStatus.text = "이름 을 입력하세요."
            return
        }
        
        let urlString: String = "http://localhost:8888/login/insertUser2.php"
        guard let requestURL = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        let restString: String = "id=" + textID.text! + "&password=" + textPasswd.text! + "&name=" + textName.text!
        request.httpBody = restString.data(using: .utf8)
        self.executeRequest(request: request)
    }
    

    @IBAction func btnToLoginView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func executeRequest(request: URLRequest) -> Void{
        let session = URLSession.shared
        let task = session.dataTask(with: request){
            (responseData, response, responseError) in
            
            guard responseError == nil else {
                print("Error: calling POST")
                return
            }
            
            guard let receiveData = responseData else {
                print("Error: not receiving Data")
                return
            }
            
            if let utf8Data = String(data: receiveData, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.labelStatus.text = utf8Data
                    print(utf8Data)
                }
            }
        }
        
        task.resume()
    }
}
