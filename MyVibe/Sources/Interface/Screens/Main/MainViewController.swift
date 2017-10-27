//
//  MainViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class MainViewController: ViewController<MainView>, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    private let dependencies: ApplicationDependenciesProvider
    private var albums: [Album]
    
    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
        self.albums = []
        super.init(view: MainView())
    }
    
    override func setupProperties() {
        super.setupProperties()
        customView.tableView.registerClass(AlbumCell.self)
        
        customView.searchBar.delegate = self
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumCell = tableView.dequeue()
        let currentItem = albums[indexPath.row]
        cell.songNameLabel.text = currentItem.title
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        getAlbums(withTitle: searchBarText)
    }
}

fileprivate extension MainViewController {
    fileprivate func getAlbums(withTitle title: String) {
        dependencies.apiClient.perform(request: AlbumRequest(albumTitle: title)) { [unowned self] result in
            switch result {
            case .success(let response):
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        let albumResponse = try decoder.decode(AlbumResponse.self, from: data)
                        self.albums = albumResponse.albums
                        DispatchQueue.main.async {
                            self.customView.tableView.reloadData()
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            self.handleError(title: "Error", message: error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                self.handleError(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
