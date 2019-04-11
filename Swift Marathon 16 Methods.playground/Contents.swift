import UIKit
import Foundation
/*:
Сделаем с вами небольшую игру

1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате

2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически

3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.

4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)

5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)

Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение
*/

class Room {
    var width = 10
    var height = 10
}
class Box {
    var x = 7
    var y = 6
}

class Hole {
    let y = 8
    let x = 8
}

let room1 = Room()
let box1 = Box()
let hole1 = Hole()

let winCell = "✅"
var roomCell = "⬜️"
let heroCell = "🤾‍♂️"
let holeCell = "🕳"
let boxCell = "🕋"



class Hero {
    var x = 2 {
        didSet {
            x = (x > room1.width || x < 0) ? oldValue : x
        }
    }
    var y = 5 {
        didSet {
            y = (y > room1.height || y < 0) ? oldValue : y
        }
    }
    
    enum Direction {
        case up, down, left, right
    }
    
    func move (dir: Direction) {
        switch dir {
        case .up where self.y >= 1:
            checkHero(dir: .up)
            self.y -= 1
            if checkBox(dir: .up){
                box1.y -= 1
            }
        case .down where self.y <= room1.height - 1:
            checkHero(dir: .down)
            self.y += 1
            if checkBox(dir: .down){
                box1.y += 1
            }
        case .left where self.x >= 1:
            checkHero(dir: .left)
            self.x -= 1
            if checkBox(dir: .left){
                box1.x -= 1
            }
        case .right where self.x <= room1.width - 1:
            if checkHero(dir: .right) {
            self.x += 1
            if checkBox(dir: .right){
                box1.x += 1
            }
            }
        default:
            print("Ooops")
            break
            
        }
        drawGame()
    }
    
    func checkHero (dir: Direction) -> Bool {
        switch dir {
        case .up:
            return !(hero1.y + box1.y == 1)
        case .down:
            return (hero1.y + box1.y <= room1.height * 2 - 1)
        case .left:
            return !(hero1.x + box1.x == 1)
        case.right:
            return (hero1.x + box1.x <= room1.width * 2 - 2)
        }
    }
    

    
    
    
    
    
    func checkBox (dir: Direction) -> Bool {
        let boxAndHeroOnSamePlace = box1.y == hero1.y && box1.x == hero1.x
        switch dir {
        case .up:
            return box1.y >= 1 && boxAndHeroOnSamePlace
        case .down:
            return box1.y <= (room1.height - 1) && boxAndHeroOnSamePlace
        case .left:
            return box1.x >= 1 && boxAndHeroOnSamePlace
        case .right:
            return box1.x <= (room1.width - 1) && boxAndHeroOnSamePlace
        }
    }
    
    

}
func drawGame () {
    for y in 0...room1.width {
        var cell = ""
        for x in 0...room1.height {
            switch (x, y) {
            case (hero1.x, hero1.y):
                cell = heroCell
            case (box1.x, box1.y):
                cell = boxCell
            case (hole1.x, hole1.y):
                cell = holeCell
            default:
                cell = roomCell
                if box1.x == hole1.x && box1.y == hole1.y {
                    cell = winCell
                }
            }
            print(cell, terminator: " ")
        }
        print("")
    }
    print("------------------------------------------")
}


let hero1 = Hero()
hero1.move(dir: .down)
hero1.move(dir: .right)
hero1.move(dir: .right)
hero1.move(dir: .right)
hero1.move(dir: .right)














