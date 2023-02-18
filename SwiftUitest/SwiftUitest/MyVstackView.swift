//
//  MyVstackView.swift
//  SwiftUitest
//
//  Created by 박주영 on 2023/02/18.
//

import SwiftUI

struct MyVstackView: View {
    @Binding var isActivated : Bool
    
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    var body: some View {
        VStack {
            Text("1!")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            Text("2!")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            Text("3!")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}


struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
