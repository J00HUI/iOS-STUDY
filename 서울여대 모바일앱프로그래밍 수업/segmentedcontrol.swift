import UIKit

class ViewController: UIViewController{

    @IBOutlet var lblDisplay: UILabel!
    @IBOutlet var smartOS: UISegmentedControl!
    @IBOutlet var leftCenterRight: UISegmentedControl!
    @IBOutlet var beerCoffeeWine: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeSelection(_ sender: UISegmentedControl) {
        if sender == smartOS || sender == leftCenterRight {
            lblDisplay.text = sender.titleForSegment(at: sender.selectedSegmentIndex)
        } else {
            let drinkArray: [String] = ["beer", "coffee", "wine"]
            
            lblDisplay.text = drinkArray[sender.selectedSegmentIndex]
        }
        
        
    }
}

