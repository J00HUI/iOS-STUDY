import UIKit

class ViewController: UIViewController {
    
    var images = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "8.jpeg"]

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 페이지 컨트롤의 현재 페이지를 0으로 설정
        
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        // 페이지 컨트롤의 현재 페이지를 가지고 옵니다. 현재 페이지에 해당하는 이미지 파일의 이름을 images 배열에서 가지고 옵니다.
    }
    
}

