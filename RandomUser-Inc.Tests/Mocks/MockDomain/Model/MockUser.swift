//
//  MockUser.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 6/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import CoreLocation

class MockUser {
    
    static func getMockUser() -> User {
        return User(gender: "female",
                    name: UserName(title: "Ms", first: "Alex", last: "Walter"),
                    location: UserLocation(street: LocationStreet(number: 24, name: "Elm Street"),
                                           city: "London",
                                           state: "London City",
                                           country: "United Kingdom",
                                           postcode: "33245",
                                           coordinates: CLLocationCoordinate2D(latitude: 77.2, longitude: -72.4),
                                           timezone: LocationTimezone(offset: "+01:00", description: "London")),
                    email: "awalter@gmail.com",
                    registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2002-08-01T14:30:52.705Z")!, age: 23),
                    phone: "49-123-289-234",
                    id: UserID(name: "PASS", value: "PEN189273", uuid: "PASS-PEN189273"),
                    picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))
    }
}
