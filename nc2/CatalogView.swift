//
//  CatalogView.swift
//  nc2
//
//  Created by Apanda Saragih on 24/05/23.
//

import Foundation
import SwiftUI

struct CatalogView: View {
    @State private var cars: [Car] = []
    @State private var selectedCar: Car? = nil
    @State var isAR: Bool
    
    var body: some View {
        NavigationView{
            if (isAR) {
                
            } else {
                ZStack {
                    VStack {
                        Text("Catalog")
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
                                ForEach(cars) { car in
                                    CatalogCardView(car: car) {
                                        selectedCar = car
                                    }
                                }
                            }
                            .padding(16)
                        }
                        .sheet(item: $selectedCar) { car in
                            CarDetailsView(car: car, isPresented: $selectedCar, isAR: $isAR)
                        }
                        .onAppear {
                            loadCarsFromJSON()
                            print(isAR)
                            print("ssssss")
                        }
                    }
                }
            }
        }
    }
    
    func loadCarsFromJSON() {
        if let fileURL = Bundle.main.url(forResource: "cars", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                cars = try decoder.decode([Car].self, from: data)
            } catch {
                print("Error loading cars from JSON: \(error)")
            }
        }
    }
}

struct CatalogCardView: View {
    let car: Car
    let onTap: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Image(car.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .shadow(radius: 5)
                .onTapGesture {
                    onTap()
                }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(car.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                
//                Text(car.description)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                    .padding(.horizontal, 8)
            }
            .padding(.vertical, 8)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CarDetailsView: View {
    let car: Car
    @Binding var isPresented: Car?
    @Binding var isAR: Bool
    @State var goToAR = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    Image(car.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 300)
                        .cornerRadius(10)
                        .padding(16)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(car.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(car.description)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                    
                    
                    NavigationLink(destination: MyUIKitView(car: car)) {
                        Text("Show")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }.onDisappear(perform: {
    //                    isAR = false
                    })
//                    Button(action: {
//                        self.goToAR = true
//                        isAR = true
//                        dismiss()
//                    }) {
//                        Text("Action")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
                    
                    
                    
                    
                }
                
                .navigationBarTitle(car.name)
//                .onDisappear {
//                    isPresented = nil
//                }
            }
            
        }
        
        
        
    }
}


struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(isAR: false)
    }
}
