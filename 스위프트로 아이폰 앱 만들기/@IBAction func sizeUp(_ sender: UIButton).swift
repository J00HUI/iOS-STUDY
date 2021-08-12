
class ViewController: UIViewController {
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?

    @IBOutlet var bulbImageView: UIImageView!
    @IBOutlet var sizeUpButton: UIButton!

override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "bulb_On")
        imgOff = UIImage(named: "bulb_Off")
    
        bulbImageView.image = imgOn
}


//MARK: - 이미지 사이즈 조절
@IBAction func sizeUp(_ sender: UIButton) {
        let scale : CGFloat = 2.0
        var newWidth : CGFloat, newHeight : CGFloat
        
        if(isZoom){
            newWidth = bulbImageView.frame.width / scale
            newHeight = bulbImageView.frame.height / scale
            sizeUpButton.setTitle("확대", for: .normal)
            
        } else {
            newWidth = bulbImageView.frame.width * scale
            newHeight = bulbImageView.frame.height * scale
            sizeUpButton.setTitle("축소", for: .normal)
            
        }
        bulbImageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
//End

//MARK: - 이미지 변경
@IBAction func imageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            bulbImageView.image = imgOn
        } else {
            bulbImageView.image = imgOff
        }
        
}
//End
