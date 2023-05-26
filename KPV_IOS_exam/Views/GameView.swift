//
//  ContentView.swift
//  KPV_IOS_exam
//
//  Created by Алиса Вышегородцева on 26.05.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            VStack {
                TitleView(text: "Пятнашки")
                Text(viewModel.movesCount == 0 ? "Игра не начата" : "Сделано ходов: \(viewModel.movesCount)")
                    .font(.system(size: Constants.smallTitle, weight: .regular))
            }
            .padding(.top, Constants.padding)
            
            Spacer()
            
            // Для создания таблцы используем LazyVGrid и flexible GridItem для того, чтобы
            // задать точное число токенов в колонке
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: Constants.spacing) {
                ForEach(viewModel.tokens) { token in
                    Button(action: {
                        viewModel.move(token: token)
                    }, label:  {
                        TokenView(token: token)
                    })
                    .disabled(token.number == 0)
                }
            }
            .padding(.horizontal, Constants.padding)
            
            Spacer()
            
            ButtonView {
                viewModel.startGame()
            }
            .padding()
        }
        // Уведомляем игрока о том, что игра закончена
        .alert(isPresented: $viewModel.isAlertPresented) {
            Alert(title: Text("Игра окончена"), message: Text("Вы потратили \(viewModel.movesCount) ходов"), dismissButton: .default(Text("OK"), action: viewModel.startGame))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
