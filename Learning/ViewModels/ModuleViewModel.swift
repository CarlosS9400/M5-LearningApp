//
//  ModuleViewModel.swift
//  Learning
//
//  Created by Carlos Dos santos on 07/09/2023.
//

import Foundation

class ModuleViewModel: ObservableObject {
    // MARK: all the modules available
    @Published var modules = [Module]()
    // MARK: the current module being used
    @Published var currentModule: Module?
    // MARK: the current lesson being used
    @Published var currentLesson: Lesson?
    
    // MARK: the index for the current module
    var currentModuleIndex: Int = 0
    // MARK: the index for the current lesson
    var currentLessonIndex: Int = 0
    
    var styleData: Data?
    
    @Published var lessonDescription = NSAttributedString()
    
    init() {
        getLocalData()
    }
    // MARK: Data getting method
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let urlData = try Data(contentsOf: jsonUrl!)
            
            let decoder = JSONDecoder()
            
            do {
                let modules = try decoder.decode([Module].self, from: urlData)
                
                self.modules = modules
                
                
            }catch{
                
                print(error)
                
            }
        } catch {
            
            print(error)
            
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        } catch {
            print("Cannot parse stylesheet")
        
        }
    }
    
    // MARK: Setting current module method
    func setCurrentModule(_ moduleid: Int) {
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    func setCurrentLesson(_ lessonIndex: Int) {
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func hasNextLesson() -> Bool {
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        } else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        if styleData != nil {
            data.append(self.styleData!)
           
        }
        
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        return resultString
    }
}
