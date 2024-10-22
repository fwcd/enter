//
//  Character+UppercasedCharacter.swift
//  Enter
//
//  Created on 22.10.24
//

extension Character {
    var uppercasedCharacter: Character {
        let uppercasedString = uppercased()
        return if uppercasedString.count == 1 {
            uppercasedString.first!
        } else {
            self
        }
    }
}
