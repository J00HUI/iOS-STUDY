import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblNum1: UILabel!
    @IBOutlet var lblNum2: UILabel!
    @IBOutlet var lblNum3: UILabel!
    @IBOutlet var lblNum4: UILabel!
    @IBOutlet var lblNum5: UILabel!
    @IBOutlet var lblNum6: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func drawLotto(_ sender: UIButton) {
        
        var originalNumbers = Array(1...45)
        var index = 0
        var lottoArray = [Int]()
        
        for _ in 0...5 {
            index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
            lottoArray.append(originalNumbers[index])
            originalNumbers.remove(at: index)
        }
        
        lblNum1.text = String(lottoArray[0])
        lblNum2.text = String(lottoArray[1])
        lblNum3.text = String(lottoArray[2])
        lblNum4.text = String(lottoArray[3])
        lblNum5.text = String(lottoArray[4])
        lblNum6.text = String(lottoArray[5])

    }
    
}

