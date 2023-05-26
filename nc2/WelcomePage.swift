//
//  WelcomePage.swift
//  nc2
//
//  Created by Apanda Saragih on 24/05/23.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @State private var isCatalog = false
//    @State var isAR: Bool = false
    var body: some View {
        if isCatalog {
            CatalogView(isAR: false)
        } else {
            VStack {
                Spacer()
                
                Image("welcome-car")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 300)
                
                Spacer()
                
                Button(action: {
                    changeToCatalog();
                }) {
                    Text("Start")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarHidden(true)
        }
        
        
    }
    
    private func changeToCatalog() {
        self.isCatalog = true;
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
