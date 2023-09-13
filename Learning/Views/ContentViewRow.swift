//
//  ContentViewRow.swift
//  Learning
//
//  Created by Carlos Dos santos on 09/09/2023.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model: ModuleViewModel
    var index: Int = 0
    
    var body: some View {
        let lesson = model.currentModule?.content.lessons[index]
        
        if lesson != nil {
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(height: 66)
                
                HStack (spacing: 30){
                    Text(String(index+1))
                        .padding(.horizontal)
                        .font(.largeTitle)
                        
                    
                    VStack(alignment: .leading){
                        Text(lesson!.title)
                            .font(.title2)
                            
                           
                        Text(lesson!.duration)
                            .font(.headline)
                            
                    }
                }.padding()
                
            }
            .foregroundColor(.black)
            .padding(.bottom, 10)
        }
    }
}


