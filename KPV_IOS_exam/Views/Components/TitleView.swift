//
//  TitleView.swift
//  KPV_IOS_exam
//
//  Created by Алиса Вышегородцева on 26.05.2023.
//

import SwiftUI

struct TitleView: View {
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: Constants.bigTitle))
            .bold()
    }
}
