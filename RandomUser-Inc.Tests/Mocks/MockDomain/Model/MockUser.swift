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
    
    static func getMockUser2() -> User {
        return User(gender: "male",
                    name: UserName(title: "Mr", first: "Juan Ignacio", last: "Delgado"),
                    location: UserLocation(street: LocationStreet(number: 3, name: "Malasaña"),
                                           city: "Madrid",
                                           state: "Comunidad de Madrid",
                                           country: "Spain",
                                           postcode: "12567",
                                           coordinates: CLLocationCoordinate2D(latitude: 77.2, longitude: -72.4),
                                           timezone: LocationTimezone(offset: "+02:00", description: "Madrid/Europe")),
                    email: "jidelgado@yahoo.com",
                    registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2002-08-01T14:30:52.705Z")!, age: 23),
                    phone: "49-123-289-234",
                    id: UserID(name: "DNI", value: "38799985C", uuid: "DNI-38799985C"),
                    picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))
    }

    static func getMockUser3() -> User {
        return User(gender: "female",
                    name: UserName(title: "Ms", first: "Melania", last: "Blister"),
                    location: UserLocation(street: LocationStreet(number: 12, name: "Oak Avenue"),
                                           city: "Seattle",
                                           state: "Washington",
                                           country: "United States",
                                           postcode: "W1892S",
                                           coordinates: CLLocationCoordinate2D(latitude: 77.2, longitude: -72.4),
                                           timezone: LocationTimezone(offset: "-08:00", description: "Seattle/America")),
                    email: "melanieblisterbalotelli@yahoo.com",
                    registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2002-08-01T14:30:52.705Z")!, age: 23),
                    phone: "49-123-289-234",
                    id: UserID(name: "GRE", value: "71823921JA", uuid: "GRE-71823921JA"),
                    picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))
    }
    
    static func getMockUserArray() -> [User] {
        return [MockUser.getMockUser(), MockUser.getMockUser2(), MockUser.getMockUser3()]
    }
}
