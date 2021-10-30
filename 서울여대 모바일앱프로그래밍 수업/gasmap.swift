// 1. ViewController(mapview), 2. UnivTableViewController.swift, 3. University.swift


//  ViewController.swift
//  GPSMap
//
//  Created by 이주희 on 2021/10/29.


import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var map: MKMapView!
    @IBOutlet var alternateSwitch: UISwitch!
    @IBOutlet var labelAlternate: UILabel!
    
    
    var selectedIndex:Int? = nil
    var univ: University? = nil
    var universityAnnotation: University? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _ = selectedIndex{
            map.setRegion(MKCoordinateRegion(center: (self.univ?.coordinate)!, span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)), animated: true)
        }
        
        // 기존의 map에 annotation이 있었다면 삭제
        if let annotation = universityAnnotation{
            self.map.removeAnnotation(annotation)
        }
        
        // 새로운 annotation 위치가 있다면 추가
        if let annotation = univ {
            self.universityAnnotation = annotation
            self.map.addAnnotation(universityAnnotation!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUnivView"{
            if let destVC = segue.destination as? UnivTableViewController{
                destVC.mainVC = self
            }
        }
    }

    @IBAction func updateMap(_ sender: UISegmentedControl) {
        var alternate:Int = 0
        if alternateSwitch.isOn {
            alternate = 3
        }
        
        switch sender.selectedSegmentIndex + alternate {
        case 0:
            self.map.mapType = MKMapType.standard
        case 1:
            self.map.mapType = MKMapType.satellite
        case 2:
            self.map.mapType = MKMapType.hybrid
        case 3:
            self.map.mapType = MKMapType.satelliteFlyover
            self.labelAlternate.text = "satelliteFlyover"
        case 4:
            self.map.mapType = MKMapType.hybridFlyover
            self.labelAlternate.text = "hybridFloyover"
        default:
            self.map.mapType = MKMapType.mutedStandard
            self.labelAlternate.text = "mutedStandard"
        }
    }
    
}

============================================================================================================================================================

//  UnivTableViewController.swift
//  GPSMap
//
//  Created by 이주희 on 2021/10/29.

import UIKit

class UnivTableViewController: UITableViewController {
    
    var universities = [University]()
    var mainVC: ViewController? = nil
    var number:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var univ: University
        univ = University(title: "서울여자대학교", latitude: 37.6291, longitude: 127.0897)
        self.universities.append(univ)
        univ = University(title: "고려대학교", latitude: 37.5894, longitude: 127.0323)
        self.universities.append(univ)
        univ = University(title: "부산대학교", latitude: 35.2332, longitude: 129.0794)
        self.universities.append(univ)
        univ = University(title: "Harvard University", latitude: 42.36402, longitude: -71.12482)
        self.universities.append(univ)
        univ = University(title: "Michigan State Univ", latitude: 42.72401, longitude: -84.48137)
        self.universities.append(univ)
        univ = University(title: "New York University", latitude: 40.7247, longitude: -73.9903)
        self.universities.append(univ)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "대학교를 선택하세요"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return universities.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Univ Cell", for: indexPath)
        
        cell.textLabel?.text = universities[indexPath.row].title
        
        if let view = self.mainVC{
            if let index = view.selectedIndex{
                if index == indexPath.row {
                    cell.accessoryType = .checkmark
                }
                else{
                    cell.accessoryType = .none
                }
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainVC?.selectedIndex = indexPath.row
        self.mainVC?.univ = universities[indexPath.row]
        self.tableView.reloadData()
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}

============================================================================================================================================================

//  University.swift
//  GPSMap
//
//  Created by 이주희 on 2021/10/29.
//

import UIKit
import CoreLocation
import MapKit

class University: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, latitude: Double, longitude: Double){
        self.title = title
        self.coordinate = CLLocationCoordinate2D()
        self.coordinate.latitude = latitude
        self.coordinate.longitude = longitude
        
    }
}
