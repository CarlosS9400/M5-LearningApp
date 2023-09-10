//
//  HomeViewRow.swift
//  Learning
//
//  Created by Carlos Dos santos on 07/09/2023.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0), radius: 10, x: -5, y: -5)
                HStack{
                    Image(image)
                        .resizable()
                        .frame(width: 116, height: 116)
                        .clipShape(Circle())
                        .padding(.trailing, 8)
                    
                    
                    VStack(alignment: .leading){
                        Text(title)
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 5)
                        Text(description)
                            .font(.system(size: 14))
                            .padding(.bottom, 30)
                        HStack{
                            Image(systemName: "text.book.closed")
                            Text(count)
                            
                            Spacer()
                            
                            Image(systemName: "clock")
                            Text(time)
                        }.font(.system(size: 10))
                        
                    }.padding(.horizontal, 10)
                        
                }.padding(.horizontal)
        }.padding(.horizontal)
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn C++",  description: "AAAAA", count: "0 lessons", time: "0 hours")
        
    }
}
