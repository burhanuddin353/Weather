//
//  OWResponse.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import RealmSwift

protocol OWResponse: Object, Decodable {

    var errorMessage: String? { get set }
}
