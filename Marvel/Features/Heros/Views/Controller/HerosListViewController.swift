//
//  ViewController.swift
//  Marvel
//
//  Created by Vitor Spessoto on 07/02/22.
//

import UIKit

class PremiumIds {
    static let premium = [10, 11, 12, 13]
    
    static func isPremium(id: Int) -> Bool {
        return premium.contains(id)
    }
}

class HerosListViewController: UIViewController {
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.register(HerosCell.self, forCellReuseIdentifier: String(describing: HerosCell.self))
        tableView.backgroundView = activity
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var viewModel: HerosListViewModel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HerosListViewModel(service: HerosService())
        viewModel.delegate = self
        
        configureViews()
        navigationController?.title = "Lista de contatos"
        
        viewModel.loadHeros()
    }
    
    func configureViews() {
        view.backgroundColor = .red
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func isPremium(hero: HeroModel) -> Bool {
        return PremiumIds.isPremium(id: hero.id)
    }
}

extension HerosListViewController: HerosListViewModelDelegate {
    func onSuccess() {
        print("onSucces")
        tableView.reloadData()
    }
    
    func onFailure(error: Error) {
        print(error)
    }
}

extension HerosListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalHeros()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HerosCell.self), for: indexPath) as? HerosCell else {
            return UITableViewCell()
        }
        
        let hero = viewModel.getHero(at: indexPath)
        cell.fullnameLabel.text = hero.name
        
//        DispatchQueue.global().async {
//            if let urlPhoto = URL(string: hero.thumbnail) {
//                do {
//                    let data = try Data(contentsOf: urlPhoto)
//                    let image = UIImage(data: data)
//                    DispatchQueue.main.async {
//                        cell.contactImage.image = image
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = viewModel.getHero(at: indexPath)
        
        guard isPremium(hero: hero) else {
            let alert = UIAlertController(title: "Você tocou em", message: "\(hero.name)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        let alert = UIAlertController(title: "Atenção", message:"Você tocou no contato sorteado", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

