//
//  ButtonView.swift
//  KPV_IOS_exam
//
//  Created by Алиса Вышегородцева on 26.05.2023.
//

import SwiftUI

struct ButtonView: View {
    private let buttonClicked: () -> Void
    
    init(buttonClicked: @escaping () -> Void) {
        self.buttonClicked = buttonClicked
    }
    
    var body: some View {
        Button(action: buttonClicked,
               label: {
            HStack(alignment: .center){
                Text("restart")
                    .foregroundColor(.black)
                    .font(.system(size: Constants.smallTitle, weight: .medium))
                Image(systemName: "chevron.right.2")
                    .foregroundColor(.black)
            }
        })
    }
}
