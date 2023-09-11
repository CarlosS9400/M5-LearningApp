//
//  ContentDetailedView.swift
//  Learning
//
//  Created by Carlos Dos santos on 11/09/2023.
//

import SwiftUI
import AVKit

struct ContentDetailedView: View {
    
    @EnvironmentObject var model: ModuleViewModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        VStack{
            
            let url = URL(string: Constants.videoHosting + (lesson?.video ?? ""))
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
            }
            
            // MARK: Explanation in text
            
            // MARK: Button to next lesson
            
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                }
            }

        }.padding()
            
        
    }
}


