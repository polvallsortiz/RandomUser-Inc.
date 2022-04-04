//
//  UserLocation.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import CoreLocation

struct LocationStreet {

    var number: Int
    var name: String

}

struct LocationTimezone {

    var offset: String
    var description: String

}

struct UserLocation {

    var street: LocationStreet
    var city: String
    var state: String
    var country: String
    var postcode: Int
    var coordinates: CLLocationCoordinate2D
    var timezone: LocationTimezone

}

extension LocationStreet {

    func parseToLocal() -> LocationStreetLocal {
        let locationStreetLocal = LocationStreetLocal()
        locationStreetLocal.number = self.number
        locationStreetLocal.name = self.name
    }

}

extension LocationTimezone {

    func parseToLocal() -> LocationTimezoneLocal {
        let locationTimezoneLocal = LocationTimezoneLocal()
        locationTimezoneLocal.offset = self.offset
        locationTimezoneLocal.desc = self.description
        return locationTimezoneLocal
    }

}

extension UserLocation {

    func parseToLocal() -> UserLocationLocal {
        let userLocationLocal = UserLocationLocal()
        userLocationLocal.street = self.street.parseToLocal()
        userLocationLocal.city = self.city
        userLocationLocal.state = self.state
        userLocationLocal.country = self.country
        userLocationLocal.postcode = self.postcode
        userLocationLocal.latitude = self.coordinates.latitude
        userLocationLocal.longitude = self.coordinates.longitude
        userLocationLocal.timezone = self.timezone.parseToLocal()
        return userLocationLocal
    }

}
