//
//  LocationService.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 02/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService{
    
    
//  Reference: Converting Between Coordinates and User-Friendly Place Names. Retrived from https://developer.apple.com/documentation/corelocation/converting_between_coordinates_and_user_friendly_place_names
    
    func lookUpCurrentLocation(Location:CLLocation?, completionHandler: @escaping (String?)
        -> Void ) {
        
        if let lastLocation = Location {
            let geocoder = CLGeocoder()
            
            geocoder.reverseGeocodeLocation(lastLocation,completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0].locality
                    completionHandler(firstLocation)
                }
                else {

                    completionHandler(nil)
                }
            })
        }
        else {

            completionHandler(nil)
        }
    }

    // Reference End
    
}







