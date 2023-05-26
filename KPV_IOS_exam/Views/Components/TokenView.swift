//
//  tokenView.swift
//  KPV_IOS_exam
//
//  Created by Алиса Вышегородцева on 26.05.2023.
//

import SwiftUI

struct TokenView: View {
    private let token: Token
    private var number: String = ""
    
    init(token: Token) {
        self.token = token
        if token.number != 0 {
            number = String(token.number)
        }
    }
    
    var body: some View {
        
        Text(number)
            .font(.largeTitle)
            .frame(width: Constants.tokenSize, height: Constants.tokenSize)
            .foregroundColor(token.isEmpty ? .white : .black)
            .background(token.isEmpty ? Color.black : Color.white)
            .cornerRadius(Constants.cornerRadius)
    }
}
