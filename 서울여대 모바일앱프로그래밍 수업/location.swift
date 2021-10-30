//  ViewController.swift
//  Location
//
//  Created by 이주희 on 2021/10/28.


import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var latitude: UILabel!
    @IBOutlet var latitudeAccuracy: UILabel!
    @IBOutlet var longtitude: UILabel!
    @IBOutlet var longtitudeAccuracy: UILabel!
    
    @IBOutlet var toggle: UISwitch!
    
    let locManager: CLLocationManager = CLLocationManager()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 가장 최근 위치
        let location: CLLocation = locations[locations.count-1];
        
        latitude.text = String(format: "%.6f", location.coordinate.latitude)
        latitudeAccuracy.text = String(format: "%.6f", location.horizontalAccuracy)
        
        longtitude.text = String(format: "%.6f", location.coordinate.longitude)
        longtitudeAccuracy.text = String(format: "%.6f", location.verticalAccuracy)
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if CLLocationManager.locationServicesEnabled() {
            switch locManager.authorizationStatus {
            case .denied, .restricted:
                let alert = UIAlertController(title: "오류 발생", message: "위치 서비스 기능이 꺼져있습니다.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                self.toggle.isOn = false
            default:
                locManager.desiredAccuracy = kCLLocationAccuracyBest
                locManager.delegate = self
                locManager.requestWhenInUseAuthorization()
            }
        } else {
            let alert = UIAlertController(title: "오류 발생", message: "위치 서비스 제공 불가", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            locManager.startUpdatingLocation()
        }else{
            locManager.stopUpdatingLocation()
        }
    }
    
}

