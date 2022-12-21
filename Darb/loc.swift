//
//  loc.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 24/05/1444 AH.
//
import SwiftUI
import SwiftUI
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var isAuthorized: Bool = false
    override init() {
        super.init()
        locationManager.delegate = self
        
    }
    
    func requestLocation(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined:
            isAuthorized = false
            return "notDetermined"
        case .authorizedWhenInUse:
            
            return "authorizedWhenInUse"
        case .authorizedAlways:
            self.isAuthorized = true
            return "authorizedAlways"
        case .restricted:
            isAuthorized = false
            return "restricted"
        case .denied:
            isAuthorized = false
            return "denied"
        default:
            return "unknown"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.startUpdatingLocation()
        guard let location = locations.last else { return }
        lastLocation = location
        print(location)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: error while getting location")
    }
}


struct LocationView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        NavigationView{
            VStack{
                Button {
                    locationManager.requestLocation()
                } label: {
                    Text("Get location")
                }
                Text("Lat  :\(Double(locationManager.lastLocation?.coordinate.latitude  ?? 0.0))")
                Text("Long :\(Double(locationManager.lastLocation?.coordinate.longitude ?? 0.0))")
            }
        }
    }
}

struct Loc_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .preferredColorScheme(.dark)
    }
}

