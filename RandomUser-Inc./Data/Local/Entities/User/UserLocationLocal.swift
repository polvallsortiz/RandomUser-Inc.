//
//  UserLocationLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift
import CoreLocation

class LocationStreetLocal: Object {

    @Persisted var number: Int
    @Persisted var name: String

}

class LocationTimezoneLocal: Object {

    @Persisted var offset: String
    @Persisted var desc: String

}

class UserLocationLocal: Object {

    @Persisted var street: LocationStreetLocal?
    @Persisted var city: String
    @Persisted var state: String
    @Persisted var postcode: String
    @Persisted var country: String
    @Persisted var latitude: Double
    @Persisted var longitude: Double
    @Persisted var timezone: LocationTimezoneLocal?

}

extension LocationStreetLocal {

    func parseToModel() -> LocationStreet {
        return LocationStreet(number: self.number, name: self.name)
    }

}

extension LocationTimezoneLocal {

    func parseToModel() -> LocationTimezone {
        return LocationTimezone(offset: self.offset, description: self.desc)
    }

}

extension UserLocationLocal {

    func parseToModel() -> UserLocation {
        return UserLocation(street: (self.street?.parseToModel())!,
                            city: self.city,
                            state: self.state,
                            country: self.country,
                            postcode: self.postcode,
                            coordinates: CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude),
                            timezone: (self.timezone?.parseToModel())!)
    }

}
