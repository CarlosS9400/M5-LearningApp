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
            CodeTextView()
                
            
            // MARK: Button to next lesson
            
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                }
            } else {
                Button {
                    model.currentContentSelected = nil
                } label: {
                    
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                }
            }

        }.padding().navigationTitle(model.currentLesson?.title ?? "")
            
        
    }
}


