//
//  CardContent.swift
//  SetCardGame
//
//  Created by Diego Santamaria on 21/12/23.
//

import Foundation



struct CardContent: Hashable {
    var color: Color
    var shape: Shape
    var filler: Filler
    var numberOfShapes: Int
}

enum Color: Hashable { case red, green, blue }
enum Shape: Hashable { case diamond, oval, squiggle }
enum Filler: Hashable { case solid, striped, open }
