//
//  TestView.swift
//  Learning
//
//  Created by Carlos Dos santos on 15/09/2023.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ModuleViewModel
    
    var body: some View {
        if model.currentQuestion != nil {
            VStack{
                Text("\(model.currentQuestionIndex+1) / \(model.currentModule!.test.questions.count)")
                
                CodeTextView()
                  
                
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
        }else{
            ProgressView()
        }
    }
}


