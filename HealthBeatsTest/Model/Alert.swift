//
//  Alert.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import Foundation

struct DefaultAlert {
    let title: String
    let message: String
    let actionButton: DefaultAlertAction
}

struct DefaultAlertAction {
    let title: String
    let handler: (() -> Void)?
}
