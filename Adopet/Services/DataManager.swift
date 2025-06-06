//
//  Network.swift
//  Adopet
//
//  Created by Giovanna Moeller on 14/02/24.
//

import UIKit

enum DataManagerError: Error {
    case networkError(Error)
    case dataUnavailable
    case decodingError(Error)
    case urlUnavailable
    case loginFailed(String)
}

class DataManager {
    
    func request(url: URL, completion: @escaping (Result<[Pet], DataManagerError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Pet].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    func saveUser(name: String,
                    email: String,
                    phoneNumber: String,
                    password: String) {
        // Salvar usuário no banco de dados
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, DataManagerError>) -> Void) {
        // Valores mockados para propósitos de ensino
        let mockEmail = "johndoe@gmail.com"
        let mockPassword = "123"
        
        DispatchQueue.main.async {
            if email == mockEmail && password == mockPassword {
                completion(.success(true))
            } else {
                completion(.failure(.loginFailed("Usuário ou senha incorretos.")))
            }
        }
    }
    
    func downloadPetImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
