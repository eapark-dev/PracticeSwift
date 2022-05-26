//
//  InfoView.swift
//  EliCard
//
//  Created by 박은아 on 2022/05/26.
//

import SwiftUI

struct InforView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 35)
            .overlay(HStack{
                Image(systemName: imageName).foregroundColor(.yellow)
                Text(text)
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InforView(text: "Hello", imageName: "mail")
            .previewLayout(.sizeThatFits)
    }
}
