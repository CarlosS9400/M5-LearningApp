//
//  ModuleViewModel.swift
//  Learning
//
//  Created by Carlos Dos santos on 07/09/2023.
//

import Foundation

class ModuleViewModel: ObservableObject {
    //all the modules available
    @Published var modules = [Module]()
    //the current module being used
    @Published var currentModule: Module?
    
    //the index for the current module
    var currentModuleIndex: Int = 0
    
    var styleData: Data?
    
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
    
    
}
