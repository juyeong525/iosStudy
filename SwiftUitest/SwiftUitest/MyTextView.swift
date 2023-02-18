//
//  MyTextView.swift
//  SwiftUitest
//
//  Created by 박주영 on 2023/02/18.
//

import SwiftUI

struct MyTextView: View {
    @Binding var isActivaed : Bool
    
    init(isActivaed: Binding<Bool> = .constant(false)){
        _isActivaed = isActivaed
    }
    @State private var index = 0
    
    private let backgroundColorsArray = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Text("배경아이템 인덱스 \(index)")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            Text("활성화 상태 \(String(isActivaed))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(isActivaed ? Color.yellow : Color.gray)
                .background(Color.black)
            Spacer()
            
        }.background(backgroundColorsArray[index])
            .onTapGesture {
                if self.index == backgroundColorsArray.count-1 {
                    index = 0
                } else {
                    index += 1
                }
            }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
