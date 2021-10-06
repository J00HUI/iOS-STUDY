// 1. RootTableViewController.swift, 2. SaveViewController.swift, 3. DetailViewController.swift

//  1. 
//  RootTableViewController.swift
//  FriendsInfo(CoreData)

import UIKit
import CoreData

class RootTableViewController: UITableViewController {

    
    var friends: [NSManagedObject] = []
    
    func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Friends")
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do{
            friends = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friends Cell", for: indexPath)

        let friend = friends[indexPath.row]
        var display:String = ""
        
        if let nameLabel = friend.value(forKey: "name") as? String {
            display = nameLabel
        }
        if let phoneLabel = friend.value(forKey: "phone") as? String {
            display = display + " " + phoneLabel
        }
        
        cell.textLabel?.text = display
        cell.detailTextLabel?.text = friend.value(forKey: "memo") as? String
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let context = getContext()
            context.delete(friends[indexPath.row])      // 메모리에서 삭제
            
            do {
                try context.save()                     // 현재 context를 저장소에 반영
                print("deleted!")
            } catch let error as NSError {
                print("Could net delete \(error), \(error.userInfo)")
            }
            
            friends.remove(at: indexPath.row)         // 저장기기에서 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)    // 테이블뷰에 반영
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView"{
            if let destination = segue.destination as? DetailViewController{
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.detailFriend = friends[selectedIndex]
                }
            }
        }
    }
 

}

================================================================================================================================================

//  2.
//  SaveViewController.swift
//  FriendsInfo(CoreData)

import UIKit
import CoreData
class SaveViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var textName: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context)
        
        // 새로운 record 생성
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textName.text, forKey: "name")
        object.setValue(textPhone.text, forKey: "phone")
        object.setValue(textMemo.text, forKey: "memo")
        object.setValue(Date(), forKey: "saveDate")
        
        do{
            try context.save()
            print("saved!")
        } catch let error as NSError{
            print("Could not save \(error), \(error.userInfo) ")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

================================================================================================================================================

//  3. 
//  DetailViewController.swift
//  FriendsInfo(CoreData)

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextField!
    @IBOutlet var saveDate: UITextField!
    
    
    var detailFriend: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let friend = detailFriend {
            textName.text = friend.value(forKey: "name") as? String
            textPhone.text = friend.value(forKey: "phone") as? String
            textMemo.text = friend.value(forKey: "memo") as? String
            
            let dbDate: Date? = friend.value(forKey: "saveDate") as? Date
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            if let unWrapDate = dbDate {
                saveDate.text = formatter.string(from: unWrapDate as Date)
            }
        }
    }
    


}


