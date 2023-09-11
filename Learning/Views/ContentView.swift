//
//  ContentView.swift
//  Learning
//
//  Created by Carlos Dos santos on 09/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ModuleViewModel
    
    var body: some View {
        
        ScrollView{
            LazyVStack{
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) {index in
                        
                        NavigationLink {
                            ContentDetailedView()
                                .onAppear{
                                    model.setCurrentLesson(index)
                                }
                        } label: {
                            ContentViewRow(index: index)
                        }

                        
                        
                        
                        
                    }
                }
            }.navigationTitle("Learn  \(model.currentModule?.category ?? "")")
        }
    }
}


