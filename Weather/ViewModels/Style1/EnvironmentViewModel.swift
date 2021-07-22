//
//  EnvironmentViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import Foundation

class EnvironmentViewModel {
    
    let environment = Binder("")
    
    init() {
        if config.environment != "Production" {
            environment.value = config.environment
        }
    }
}
