//
//  ViewController.swift
//  Marvel
//
//  Created by Vitor Spessoto on 07/02/22.
//

import UIKit

class HerosListViewController: UIViewController {
    
    //*************************************************
    // MARK: - Properties
    //*************************************************
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
    
    //*************************************************
    // MARK: - Initializers
    //*************************************************
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //*************************************************
    // MARK: - Lifecycle
    //*************************************************
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
        navigationController?.title = "Lista de Heróis"
        
        viewModel.loadHeros()
    }
    
    //*************************************************
    // MARK: - Private methods
    //*************************************************
    private func configureViews() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

//*************************************************
// MARK: - HerosListViewModelDelegate
//*************************************************
extension HerosListViewController: HerosListViewModelDelegate {
    func onSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activity.stopAnimating()
        }
    }
    
    func onFailure(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops, ocorreu um erro", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
    }
}

//*************************************************
// MARK: - UITableViewDataSource, UITableViewDelegate
//*************************************************
extension HerosListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalHeros()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HerosCell.self), for: indexPath) as? HerosCell else {
            return UITableViewCell()
        }
        
        let hero = viewModel.getHero(at: indexPath)
        cell.heroName.text = hero.name
        cell.heroImage.downloadImage(withURL: hero.thumbnail.fullPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = viewModel.getHero(at: indexPath)
        
        let heroDetailsViewModel = HeroDetailsViewModel(for: hero)
        let heroDetailsViewController = HeroDetailsViewController(viewModel: heroDetailsViewModel)
        
        self.navigationController?.pushViewController(heroDetailsViewController, animated: true)
    }
}

