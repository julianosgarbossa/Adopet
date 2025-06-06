//
//  DBManager.swift
//  Adopet
//
//  Created by Giovanna Moeller on 20/02/24.
//

import Foundation

class DBManager {
    var users: [User] = []
    var currentUser: User?
    
    func addUser(user: User) {
        users.append(user)
    }
    
    func authenticateUser(email: String, password: String) -> Bool {
        guard let user = users.first(where: { $0.email == email && $0.password == password }) else {
            return false
        }
        currentUser = user
        return true
    }
    
    func comparePasswords(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    func changeUserPassword(newPassword: String) {
        guard currentUser != nil else {
            print("No user is currently logged in.")
            return
        }
        currentUser?.password = newPassword
        print("Password changed successfully.")
    }
    
    func sendMessage(name: String, telephone: String, animalName: String, message: String) {
        let messageData = [
            "name": name,
            "telephone": telephone,
            "animalName": animalName,
            "message": message
        ]
        print("Salvando mensagem no banco: \(messageData)")
    }
}

