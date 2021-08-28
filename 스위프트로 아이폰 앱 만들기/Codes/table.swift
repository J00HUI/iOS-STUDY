// TableViewController

import UIKit

//MARK: - 전역 변수 : 외부 클래스에서도 접근 가능
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // 뷰가 노출될 때마다 리스트의 데이터를 다시 불러옴
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    // 테이블 안의 섹션 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    // 섹션 당 열의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    // 셀에 적용
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // 'Delete' 를 한글로 수정하기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // Override to support editing the table view. 셀을 편집
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view. 목록 옮기기
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]                  // 이동할 아이템 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]    // 이동할 아이템 이미지 저장
        
        items.remove(at: (fromIndexPath as NSIndexPath).row)                        // 이동할 아이템 삭제, 삭제한 뒤의 아이템들의 인덱스가 재정렬
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)               // 이동할 아이템의 이미지 삭제, 삭제한 뒤에 아이템의 이미지들이 재정렬
        
        items.insert(itemToMove, at: (to as NSIndexPath).row)                       // 삭제된 아이템을 이동할 위치로 삽입, 삽입한 아이템 뒤의 아이템들의 인덱스 재정렬
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)         // 삭제된 아이템의 이미지를 이동할 위치로 삽입, 삽입한 아이템 뒤의 아이템 재정렬

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[(indexPath! as NSIndexPath).row])
        }
    }

}


=============================================================================================================================
//  AddViewController

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
    }  
}



=============================================================================================================================
//  DetailViewController

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""

    @IBOutlet var labelItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelItem.text = receiveItem
    }
    
    // Main View 에서 변수를 받아오기 위한 함수
    func receiveItem(_ item: String){
        receiveItem = item
    }
    

}


