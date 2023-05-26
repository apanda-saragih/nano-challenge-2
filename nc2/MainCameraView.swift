//
//  MainCameraView.swift
//  nc2
//
//  Created by Apanda Saragih on 24/05/23.
//


import Foundation
import SwiftUI
import UIKit
import RealityKit

struct MyUIKitView: UIViewRepresentable {
    func updateUIView(_ uiView: ARView, context: Context) {

    }
    
    static let arView = ARView(frame: .zero)
    var car: Car


    func makeUIView(context: Context) -> ARView {

        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor: RealityKit.HasAnchoring

        boxAnchor = getSpecificCar(car: car)
        // Add the box anchor to the scene
        MyUIKitView.arView.scene.anchors.append(boxAnchor)

        return MyUIKitView.arView

    }
    
    func getSpecificCar(car: Car) -> RealityKit.HasAnchoring {
        let carName: String = car.name
        
        switch carName {
        case "Ford Mustang 1965":
            return try! Experience.loadFordMustang1965()
            
        case "Chevrolet Corvette":
            return try! Experience.loadChevroletCorvette()
            
        case "BMW M3 E30":
            return try! Experience.loadBmwM3E30()
            
        case "Toyota 4Runner":
            return try! Experience.loadToyota4Runner()
            
        default:
            return try! Experience.loadBmwM3E30()
        }
    }


}
