//
//  RandomAPI.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Moya

enum RandomAPITarget {

    case randomUsers(request: BaseRequest)

}

extension RandomAPITarget: TargetType {

    
}


