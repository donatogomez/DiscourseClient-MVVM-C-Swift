//
//  Coordinator.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 6/1/22.
//

import UIKit

protocol Coordinator {
    var navigator: UINavigationController { get }
    
    func start()
}
