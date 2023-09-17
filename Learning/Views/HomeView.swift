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
        NavigationView {
            VStack(alignment: .leading){
                Text("What would you like to do today?")
                    .padding(.leading)
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules) { module in
                            
                            VStack(spacing: 20){
                                
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.setCurrentModule(module.id)
                                            
                                        }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected){
                                    //Lessons
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time).multilineTextAlignment(.leading)
                                    
                                }
                                
                                NavigationLink(
                                    destination:TestView().onAppear(){
                                        model.setCurrentQuestion(module.id)
                                    },
                                    tag: module.id,
                                    selection: $model.currentTestSelected){
                                    
                                    //Test
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) questions", time: module.test.time)
                                }
                                
                                
                                
                            }
                        }
                    }.foregroundColor(.black)
                }
            }.navigationTitle("Get Started")
        }.navigationViewStyle(.stack)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModuleViewModel())
    }
}
