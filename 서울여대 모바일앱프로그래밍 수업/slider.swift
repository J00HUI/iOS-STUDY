import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var sliderR: UISlider!
    @IBOutlet var sliderB: UISlider!
    @IBOutlet var sliderG: UISlider!
    
    @IBAction func updateSlider(_ sender: UISlider) {
        self.view.backgroundColor = UIColor.init(red: CGFloat(sliderR.value), green: CGFloat(sliderB.value), blue: CGFloat(sliderG.value), alpha: 1.0)
    }
    
}

