import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    
    // 웹 페이지 주소를 url 의 인수를 통해 전달
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)            // 상수 myUrl 은 url 값을 받아 URL 형으로 선언
        let myRequest = URLRequest(url: myUrl!) // 상수 myRequest 는 상수 myUrl을 받아 URLRequest 형으로 선언
        myWebView.load(myRequest)               // UIWebView 형의 myWebView 클래스의 load 메서드 호출
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myWebView.navigationDelegate = self
        loadWebPage("https://www.naver.com/")   // 앱 실행 시 초기 홈페이지를 불러옴
    }
    
    // myWebView가 로딩 중일 때 인디케이터를 실행하고 화면에 나타나게 합니다.
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    // 로딩이 완료되었을 때 동작하므로 인디케이터를 중지하고 숨깁니다
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // 로딩 실패 시 동작하므로 마찬가지로 인디케이터를 중지하고 숨깁니다
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // "http://" 문자열이 없을 경우 자동으로 삽입
    func checkURL(_ url: String) -> String{
        var strUrl = url                            // 입력받은 url 스트링을 임시 변수 strUrl에 넣습니다.
        let flag = strUrl.hasPrefix("http://")      // "http://"를 가지고 있는지 확인한 값을 flag에 넣습니다.
        
        if !flag {
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }
    
    // 텍스트필드에 적힌 주소로 웹 뷰 로딩
    @IBAction func gotoURL(_ sender: UIButton){
        let myUrl = checkURL(urlTextField.text!)
        urlTextField.text = ""
        loadWebPage(myUrl)
    }
    
    //[Site1] 버튼 클릭시 url로 이동
    @IBAction func gotoSite1(_ sender: UIButton){
        loadWebPage("http://fallinmac.tistory.com")
    }
    
    //[Site2] 버튼 클릭시 url로 이동
    @IBAction func gotoSite2(_ sender: UIButton){
        loadWebPage("http://blog.2sam.net")
        
    }
    
    // HTML 코드를 변수에 저장하고 [html] 버튼을 클릭하면
    // HTML 문법에 맞게 작성된 문자열 변수를 웹 뷰로 나타냄
    @IBAction func loadHTMLString(_ sender: UIButton){
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>" // HTML 문을 변수에 저장
        myWebView.loadHTMLString(htmlString, baseURL: nil)  // loadHTMLString 함수를 이용하여 변수에 저장된 HTML 문을 웹 뷰에 나타냅니다.
    }
    /*
     htmlString 문자열 상수에 HTML 코드를 대입할 때는 큰 따옴표("") 안에 넣어야 합니다.
     그런데 이때 다음 코드처럼 줄을 바꿔 입력하면 에러가 발생합니다. 따라서 아래의 HTML 코드를 위의 코드처럼 줄 바꿈 없이 사용해야 합니다.
     
     ```
     <h1> HTML String </h1>
     <p> String 변수를 이용한 웹페이지 </p>
     <p>
        < a href="\"http://2sam.net\">2sam</a>으로 이동
     </p>
     ```
     
     */
    
    // htmlView.html을 웹 뷰로 나타냄
    @IBAction func loadHTMLFile(_ sender: UIButton){
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")        // htmlView.html 파일에 대한 패스 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!)     // 패스 변수를 이용하여 URL 변수 생성
        let myRequest = URLRequest(url: myUrl)          // URL 변수를 이용하여 Request 변수를 생성
        myWebView.load(myRequest)                       // Request 변수를 이용하여 HTML 파일을 로딩
    }
    
    @IBAction func stop(_ sender: UIBarButtonItem){
        myWebView.stopLoading() // 웹 페이지의 로딩을 중지시키는 함수 호출
    }
    
    @IBAction func reload(_ sender: UIBarButtonItem){
        myWebView.reload()    // 웹 페이지를 재로딩시키는 함수 호출
    }
    @IBAction func goback(_ sender: UIBarButtonItem){
        myWebView.goBack()    // 이전 웹 페이지로 이동시키는 함수 호출
        
    }
    @IBAction func goforward(_ sender: UIBarButtonItem){
        myWebView.goForward()   // 다음 웹 펭피지로 이동시키는 함수 호출
    }


}


<htmlView.hmtl>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <h1> HTML FILE </h1>
        html File을 이용한 웹페이지<br>
        <p><a href="http://blog.2sam.net">2sam 블로그</a>로 이동</p>
    </body>
</html>


