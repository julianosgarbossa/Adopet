//
//  PetsDataService.swift
//  Adopet
//
//  Created by Juliano Sgarbossa on 12/06/25.
//

import Foundation

protocol PetsDataServiceDelegate: AnyObject {
    func didFetchPetsSuccessfully(pets: [Pet])
    func didFailtWithError(error: NetworkingError)
}

class PetsDataService {
    
    weak var delegate: PetsDataServiceDelegate?
    
    private var networkingService: NetworkingProtocol
    
    init(networkingService: NetworkingProtocol) {
        self.networkingService = networkingService
    }
    func fetchPets() {
        guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
        
        networkingService.request(url: url) { [weak self] (result: Result<[Pet], NetworkingError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pets):
                    self?.delegate?.didFetchPetsSuccessfully(pets: pets)
                case .failure(let failure):
                    self?.delegate?.didFailtWithError(error: failure)
                }
            }
        }
    }
}
