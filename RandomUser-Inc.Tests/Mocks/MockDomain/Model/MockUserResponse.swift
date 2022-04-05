//
//  MockUserResponse.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import CoreLocation

class MockUserResponse {

    static func getMockUserResponse() -> UserResponse {

        let user1 = User(gender: "female",
                         name: UserName(title: "Ms", first: "Alex", last: "Walter"),
                         location: UserLocation(street: LocationStreet(number: 24, name: "Elm Street"),
                                                city: "London",
                                                state: "London City",
                                                country: "United Kingdom",
                                                postcode: 33245,
                                                coordinates: CLLocationCoordinate2D(latitude: 77.2, longitude: -72.4),
                                                timezone: LocationTimezone(offset: "+01:00", description: "London")),
                         registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2002-08-01T14:30:52.705Z")!, age: 23),
                         phone: "49-123-289-234",
                         id: UserID(name: "PASS", value: "PEN189273"),
                         picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))

        let user2 = User(gender: "male",
                         name: UserName(title: "Mr", first: "Juan", last: "Joseba"),
                         location: UserLocation(street: LocationStreet(number: 24, name: "Poniente"),
                                                city: "Bilbao",
                                                state: "Basque Country",
                                                country: "Spain",
                                                postcode: 234567,
                                                coordinates: CLLocationCoordinate2D(latitude: 42.4, longitude: 2.17),
                                                timezone: LocationTimezone(offset: "+02:00", description: "Madrid")),
                         registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2022-01-10T14:23:52.705Z")!, age: 56),
                         phone: "34-678902123",
                         id: UserID(name: "DNI", value: "123456789E"),
                         picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))
        
        let userResponse = UserResponse(users: [user1, user2],
                                        info: UserResponseInfo(seed: "mockresponse",
                                                               results: 2,
                                                               page: 1,
                                                               version: "1.3"))
        return userResponse

    }

    static func getMockUserResponse2() -> UserResponse {

        let user1 = User(gender: "female",
                         name: UserName(title: "Ms", first: "Alex", last: "Walter"),
                         location: UserLocation(street: LocationStreet(number: 24, name: "Elm Street"),
                                                city: "London",
                                                state: "London City",
                                                country: "United Kingdom",
                                                postcode: 33245,
                                                coordinates: CLLocationCoordinate2D(latitude: 77.2, longitude: -72.4),
                                                timezone: LocationTimezone(offset: "+01:00", description: "London")),
                         registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2002-08-01T14:30:52.705Z")!, age: 23),
                         phone: "49-123-289-234",
                         id: UserID(name: "PASS", value: "PEN189275"),
                         picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))

        let user2 = User(gender: "male",
                         name: UserName(title: "Mr", first: "Juan", last: "Joseba"),
                         location: UserLocation(street: LocationStreet(number: 24, name: "Poniente"),
                                                city: "Bilbao",
                                                state: "Basque Country",
                                                country: "Spain",
                                                postcode: 234567,
                                                coordinates: CLLocationCoordinate2D(latitude: 42.4, longitude: 2.17),
                                                timezone: LocationTimezone(offset: "+02:00", description: "Madrid")),
                         registered: UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: "2022-01-10T14:23:52.705Z")!, age: 56),
                         phone: "34-678902123",
                         id: UserID(name: "DNI", value: "123456780E"),
                         picture: UserPicture(large: "imageurl1", medium: "imageurl2", thumbnail: "imageurl3"))
        
        let userResponse = UserResponse(users: [user1, user2],
                                        info: UserResponseInfo(seed: "mockresponse",
                                                               results: 2,
                                                               page: 2,
                                                               version: "1.3"))
        return userResponse

    }
}
