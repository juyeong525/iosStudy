//
//  ContentView.swift
//  SwiftUitest
//
//  Created by 박주영 on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActivated = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                }
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                
                .onTapGesture {
                    withAnimation {
                        self.isActivated.toggle()
                    }
                }
                NavigationLink(destination: MyTextView(isActivaed: $isActivated)) {
                    Text("네비게이션")
                        .padding()
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top, 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
