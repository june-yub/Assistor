//
//  ContentView.swift
//  Assistor
//
//  Created by Junyeop Jeon on 7/27/21.


import SwiftUI

struct ContentView: View {
    var body: some View {

        HStack
        {
            Text("Click the")
            Image("cactus6")
            Text("button above.")
            
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
