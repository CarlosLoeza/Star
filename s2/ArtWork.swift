//
//  Artwork.swift
//  s2
//
//  Created by Carlos Loeza on 6/9/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import Foundation
import MapKit
import Contacts // for when you need to set the address, city or state fields of a location.

class Artwork: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

    
  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  )
  {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
  }

    
  var subtitle: String? {
    return locationName
  }
    var mapItem: MKMapItem? {
    guard let location = locationName
        else {
        return nil}

    let addressDict = [CNPostalAddressStreetKey: location]
    let placemark = MKPlacemark(
        coordinate: coordinate,
        addressDictionary: addressDict)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = title
    return mapItem
  }
    
    
    
    
}
