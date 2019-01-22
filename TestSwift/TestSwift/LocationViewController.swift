//
//  LocationViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/9/30.
//  Copyright © 2018 dx l. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationViewController: UIViewController {

    let locationManager = CLLocationManager()
    let amapView = MKMapView.init(frame: CGRect.init(x: 0, y: 44, width: 375, height: 400))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.view.addSubview(self.amapView)
        self.amapView.delegate = self
        // 用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
        self.amapView.userTrackingMode = MKUserTrackingMode.follow
        // 地图类型
        self.amapView.mapType = MKMapType.standard
        
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("notDetermined")
           locationManager.requestWhenInUseAuthorization()
            break
        case .restricted, .denied:
            print("restricted, .denied")
            break
        case .authorizedAlways, .authorizedWhenInUse:
            print("authorizedAlways")
            break

        }
        
        if !CLLocationManager.locationServicesEnabled() {
            print("locationServicesEnabled == NO")
        }
        
        // 定位精度
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 设置代理
        self.locationManager.delegate = self
        
        self.locationManager.requestAlwaysAuthorization()
        // 刷新的最小间距
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager .startUpdatingLocation()
        
        let window = UIApplication.shared.delegate?.window
        print("11111111111111111")
//        print(window??.safeAreaInsets)
        // Optional(__C.UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0))
        // Optional(__C.UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))

    }
    
    override func viewSafeAreaInsetsDidChange() {
        print("2222222222")
//        print(self.view.safeAreaInsets)
        //这里有个大坑，你会发现，当这个控制器以动画的方式push进来时，导航栏的高度也会动画地变高，产生了不必要的多余动画，这种体验很糟糕
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LocationViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        // 获取当前城市
        if locations.count > 0{
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(manager.location ?? locations[0]) { (placeMarks: [CLPlacemark]?, error: Error?) in
                if let placeMarkssss = placeMarks {
                    if placeMarkssss.count > 0 {
                        let placeMark : CLPlacemark = placeMarkssss[0]
                        var city = placeMark.locality
                        if city == nil {
                            city = placeMark.administrativeArea
                        }
                        
                        
                        /*
                         (lldb) po placeMark.thoroughfare
                         ▿ Optional<String>
                         - some : "万柳中路11号派顿大厦5层"
                         
                         (lldb) po placeMark.name
                         ▿ Optional<String>
                         - some : "优学汇英语(橡树园校区)"
                         
                         (lldb) po placeMark.subThoroughfare
                         nil
                         
                         (lldb) po placeMark.locality
                         ▿ Optional<String>
                         - some : "北京市"
                         
                         (lldb) po placeMark.location
                         ▿ Optional<CLLocation>
                         - some : <+39.96781031,+116.29669578> +/- 100.00m (speed -1.00 mps / course -1.00) @ 2018/9/30 中国标准时间 下午2:56:21
                         
                         (lldb) po placeMark.subLocality
                         ▿ Optional<String>
                         - some : "海淀区"
                         
                         (lldb) po placeMark.postalCode
                         nil
                         
                         (lldb) po placeMark.isoCountryCode
                         ▿ Optional<String>
                         - some : "CN"
                         
                         (lldb) po placeMark.country
                         ▿ Optional<String>
                         - some : "中国"
                         
                         (lldb) po placeMark.inlandWater
                         nil
                         
                         (lldb) po placeMark.ocean
                         nil
                         
                         (lldb) po placeMark.areasOfInterest
                         ▿ Optional<Array<String>>
                         ▿ some : 1 element
                         - 0 : "万柳"
                         
                         (lldb) po placeMark.timeZone
                         ▿ Optional<TimeZone>
                         ▿ some : Asia/Shanghai (current)
                         - identifier : "Asia/Shanghai"
                         - kind : "current"
                         ▿ abbreviation : Optional<String>
                         - some : "GMT+8"
                         - secondsFromGMT : 28800
                         - isDaylightSavingTime : false

                         */
                        
                        print("city =")
                        print(city ?? "111")
                        
                    }
                }
            }
        }
        
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        
    }
    
}

extension LocationViewController : MKMapViewDelegate {
    
}
