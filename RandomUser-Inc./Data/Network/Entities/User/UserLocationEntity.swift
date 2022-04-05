//
//  UserLocationEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import CoreLocation

struct LocationStreetEntity: Codable {

    var number: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case number, name
    }

}

struct LocationCoordinatesEntity: Codable {

    var latitude: String
    var longitude: String

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }

}

struct LocationTimezoneEntity: Codable {

    var offset: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case offset, description
    }

}

struct UserLocationEntity: Codable {

    var street: LocationStreetEntity
    var city: String
    var state: String
    var country: String
    var postcodeaux: RelaxedString
    var postcode: String {
        get { postcodeaux.value }
        set { postcodeaux = RelaxedString(newValue) }
    }
    var coordinates: LocationCoordinatesEntity
    var timezone: LocationTimezoneEntity

    enum CodingKeys: String, CodingKey {
        case street, city, state, country, coordinates, timezone
        case postcodeaux = "postcode"
    }

}

extension LocationStreetEntity {

    func parseToModel() -> LocationStreet {
        return LocationStreet(number: self.number, name: self.name)
    }

}

extension LocationTimezoneEntity {

    func parseToModel() -> LocationTimezone {
        return LocationTimezone(offset: self.offset, description: self.description)
    }

}

extension UserLocationEntity {

    func parseToModel() -> UserLocation {
        return UserLocation(street: self.street.parseToModel(),
                            city: self.city,
                            state: self.state,
                            country: self.country,
                            postcode: self.postcode,
                            coordinates: CLLocationCoordinate2D(latitude: Double(self.coordinates.latitude)!,
                                                                longitude: Double(self.coordinates.longitude)!),
                            timezone: self.timezone.parseToModel())
    }
}
