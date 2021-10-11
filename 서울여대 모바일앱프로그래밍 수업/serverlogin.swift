// 1. ViewController.swift, 2. CreateViewController.swift, 3. loginUser2.php, 4. insertUser2.php
//  ViewController.swift (LOGIN)

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


==============================================================================================================================
//  CreateViewController.swift (JOIN)

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

==============================================================================================================================
// loginUser2.php

<?php

    // localhost, ID, password, database
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');
    $userid = ($_POST['id']);
    $sql = "select userid, passwd, name from user where userid = '$userid' limit 1";
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_row($result)) {
            $dbUserid = $row[0];
            $dbPassword = $row[1];
            $dbName = $row[2];

            $password = ($_POST['password']);
            $password = md5($password);

            if($userid == $dbUserid && $password == $dbPassword) {
                echo json_encode(array("success"=>"YES", "name"=>$dbName));
            } else {
                echo json_encode(array("success"=>"NO", "error"=>"Password is invalid"));
            }
        }
    } else {
        echo json_encode(array("success"=>"NO", "error"=>"ID not exist"));
    }

    mysqli_close($conn);
?>

==============================================================================================================================
// insertUser2.php

<?php
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');

    header('Content-Type: charset=utf-8');

    $userid = ($_POST['id']);
    $password = ($_POST['password']);
    $password = md5($password);
    $name = ($_POST['name']);

    $sql = "insert into user (userid, passwd, name) values ('$userid', '$password', '$name')";

    if(mysqli_query($conn, $sql)){
        echo 'insert Done!!!';
    } else {
        echo mysqli_error($conn);
    }

    mysqli_close($conn);

?>

