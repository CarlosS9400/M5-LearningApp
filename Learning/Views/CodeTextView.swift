//
//  CodeTextView.swift
//  Learning
//
//  Created by Carlos Dos santos on 12/09/2023.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ModuleViewModel
    
    func makeUIView(context: Self.Context) -> UITextView {
            
            let textView = UITextView()
            textView.isEditable = false
            return textView
            
        }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = model.codeText
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        //textView.backgroundColor = .black
        //textView.textColor = .white
        
    }

}


