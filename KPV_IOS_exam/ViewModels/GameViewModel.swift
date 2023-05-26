//
//  GameViewModel.swift
//  KPV_IOS_exam
//
//  Created by Алиса Вышегородцева on 26.05.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var tokens: [Token] = []
    @Published var movesCount: Int = 0
    @Published var isAlertPresented: Bool = false
    
    init() {
        startGame()
    }
    
    // В начале игры создаем массив, содержащий токены с номерами от 1 до 15 и токен с номером 0, который будет главным.
    // Используем isEmpty, чтобы в дальнейшем было легче определить главный токен.
    // После создания массива, перемешиваем его и сбрасываем количество ходов (если игра уже была сыграна)
    func startGame() {
        tokens = (1...15).map { Token(id: $0, number: $0, isEmpty: false) }
        tokens.append(Token(id: 16, number: 0, isEmpty: true))
        tokens.shuffle()
        movesCount = 0
    }
    
    // Для движения токена по полю нам нужно получить индекс главного токена и индекс токена, на который мы нажали.
    // После этого следует проверить, стоит ли токен, на который мы нажали, рядом с главным токеном.
    // Если проверка успешна, меняем местами токены в массиве, что перерисовывает вью.
    // После перемещения следует проверить, закончилась ли игра
    func move(token: Token) {
        guard !token.isEmpty else {
            return
        }
        
        let empty = tokens.firstIndex { $0.isEmpty } ?? 0
        let index = tokens.firstIndex(of: token) ?? 0
        
        if isNear(first: index, second: empty) {
            tokens.swapAt(index, empty)
            movesCount += 1
        }
        
        if isGameFinished() {
            isAlertPresented = true
        }
    }
    
    // Для проверки, находятся ли токены рядом, берем индексы первого и второго токена и проверяем.
    // Если токены находятся рядом в строке, разность их индексов будет 1.
    // Если токены находятся рядом в столбце, разность их индексов будет 4.
    private func isNear(first: Int, second: Int) -> Bool {
        let diff = abs(first - second)
        return diff == 1 || diff == 4
    }
    
    // Для проверки, закончилась ли игра, нам нужно проверить, *совпадает* ли номер токена с его
    // текущим индексом в массиве для всех токенов.
    private func isGameFinished() -> Bool {
        for (index, token) in tokens.enumerated() {
            if token.number != index + 1 {
                return false
            }
        }
        return true
    }
}
