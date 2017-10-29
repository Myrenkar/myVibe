//
//  AlbumsViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class AlbumsViewController: ViewController<AlbumsView>, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    private let dependencies: ApplicationDependenciesProvider
    private var albums: [Album]
    
    private var albumResponse: AlbumResponse?
    private var albumTitle: String?
    private var currentPage: Int?
    
    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
        self.albums = []
        super.init(view: AlbumsView())
    }
    
    override func setupProperties() {
        super.setupProperties()
        title = .localized("albums.title")
        
        customView.tableView.registerClass(AlbumCell.self)
        
        customView.searchBar.delegate = self
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumCell = tableView.dequeue()
        let currentItem = albums[indexPath.row]
        cell.songNameLabel.text = currentItem.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let albumResponse = albumResponse, let page = currentPage, let albumTitle = albumTitle, indexPath.row == albums.count - 1 else { return }
        
        if page < albumResponse.pagination.pages  {
            currentPage! += 1
            getAlbums(withTitle: albumTitle, page: currentPage!)
        } else {
            tableView.tableFooterView = nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = albums[indexPath.row]
        let trackDetailsViewController = TrackDetailsVieWController(trackId: selectedItem.id, dependencies: self.dependencies)
        navigationController?.pushViewController(trackDetailsViewController, animated: true)
    }
    
    // MARK: UISearchBar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        albumTitle  = searchBarText
        albums.removeAll()
        getAlbums(withTitle: searchBarText, page: 1)
        currentPage = 1
    }
}

fileprivate extension AlbumsViewController {
    fileprivate func getAlbums(withTitle title: String, page: Int) {
        dependencies.apiClient.perform(request: AlbumRequest(albumTitle: title, page: page)) { [unowned self] result in
            switch result {
                case .success(let response):
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        do {
                            let deodedAlbumResponse = try decoder.decode(AlbumResponse.self, from: data)
                            self.albumResponse = deodedAlbumResponse
                            self.albums.append(contentsOf: deodedAlbumResponse.albums)
                            DispatchQueue.main.async {
                                self.customView.tableView.reloadData()
                            }
                        } catch let error {
                            DispatchQueue.main.async {
                                self.handleError(title: .localized("general.error.title"), message: error.localizedDescription)
                            }
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.handleError(title: .localized("general.error.title"), message: error.localizedDescription)
                    }
                }
        }
    }
}
