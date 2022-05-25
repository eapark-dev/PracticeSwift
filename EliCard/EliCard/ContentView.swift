//
//  ContentView.swift
//  EliCard
//
//  Created by 박은아 on 2022/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 1.00, green: 0.8, blue: 0.52).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("euna")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110.0, height: 140.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color .white, lineWidth: 2)
                    )
                Text("Eli Park")
                    .font(Font.custom("Pacifico-Regular", size: 30)).bold()
                .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Divider()
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(height: 35)
                    .overlay(Text("eapark5908@gmail.com"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
