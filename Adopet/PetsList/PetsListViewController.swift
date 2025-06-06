//
//  PetsListViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class PetsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [Pet] = []
    private var dataManager = DataManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell", for: indexPath) as? PetTableViewCell else {
            return UITableViewCell()
        }
        cell.set(pet: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(PetDetailsViewController(pet: data[indexPath.row]), animated: true)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.insetsContentViewsToSafeArea = false
        tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: "PetTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setVisualElements()
        self.setupTableHeaderView()
        self.setupNavigationBarButton()
        self.fetchAllPets()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setConstraints()
    }
    
    private func setVisualElements() {
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -view.safeAreaInsets.top).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
    }
    
    private func setupTableHeaderView() {
        self.tableView.tableHeaderView = TableHeaderView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 200))
    }
    
    private func setupNavigationBarButton() {
        let backItem = UIBarButtonItem()
        backItem.title = "Pets"
        backItem.tintColor = .white
        navigationItem.backBarButtonItem = backItem
    }
    
    private func fetchAllPets() {
        dataManager.request(url: URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets")!) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self.data = result
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
