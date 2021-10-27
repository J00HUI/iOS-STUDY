// 1. FirstViewController.swift, 2. SecondViewController.swift, 3. ThirdTableViewController.swift, 4. AppDelegate.swift

//  FirstViewController.swift
//  TabBar

//  Created by 이주희 on 2021/10/24.

import UIKit
import UserNotifications

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 'shard' returns the singleton app instance
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .alert, .sound], completionHandler: {
            (granted, error) in
            if(granted){
                print("Approval granted to send notifications")
            }
            else {
                print(error!)
            }
        })
        application.registerForRemoteNotifications()
        
        application.applicationIconBadgeNumber = 0
    
    }
    
    @IBAction func addBeer(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cart.append("맥주 하나 추가요~")
        //print("맥주 하나 추가요")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.children[2] as? ThirdTableViewController
        tableVC?.cartTab.badgeValue = String(format: "%d", appDelegate.cart.count)
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.cart.count
    }

}


=======================================================================================================================================

//  SecondViewController.swift
//  TabBar
//
//  Created by 이주희 on 2021/10/24.

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addWine(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cart.append("와인 하나 추가요***")
        //print("와인 하나 추가요")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.children[2] as! ThirdTableViewController
        tableVC.cartTab.badgeValue = String(format: "%d", appDelegate.cart.count)
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.cart.count
    }

}

=======================================================================================================================================

//  ThirdTableViewController.swift
//  TabBar
//
//  Created by 이주희 on 2021/10/24.

import UIKit

class ThirdTableViewController: UITableViewController {

    @IBOutlet var cartTab: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.cart.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cart Cell", for: indexPath)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        cell.textLabel?.text = appDelegate.cart[indexPath.row]

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
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.cart.remove(at: indexPath.row)
            cartTab.badgeValue = String(format: "%d", appDelegate.cart.count)
            let application = UIApplication.shared
            application.applicationIconBadgeNumber = appDelegate.cart.count
            
            //table Cell 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}

=======================================================================================================================================

//  AppDelegate.swift
//  TabBar
//
//  Created by 이주희 on 2021/10/24.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var cart:[String] = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle


}



