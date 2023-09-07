//
//  ContentView.swift
//  Learning
//
//  Created by Carlos Dos santos on 06/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ModuleViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModuleViewModel())
    }
}
