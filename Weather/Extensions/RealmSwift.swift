//
//  RealmSwift.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 21/07/21.
//

import RealmSwift

extension Realm {
    
    func deleteAll<T: Object>(_ type: T.Type) {
        delete(objects(T.self))
    }
}
