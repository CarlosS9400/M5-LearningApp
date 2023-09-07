//
//  ModuleViewModel.swift
//  Learning
//
//  Created by Carlos Dos santos on 07/09/2023.
//

import Foundation

class ModuleViewModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
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
    
    
}
