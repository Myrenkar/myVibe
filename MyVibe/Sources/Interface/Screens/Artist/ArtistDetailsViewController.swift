//
//  ArtistDetailsViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class ArtistDetailsViewController: ViewController<ArtistDetailsView>, UITableViewDataSource, UITableViewDelegate {
    private let dependencies: ApplicationDependenciesProvider
    private let artistId: Int
    private var artistDetails: ArtistDetails?
    
    init(artistId: Int, dependencies: ApplicationDependenciesProvider) {
        self.artistId = artistId
        self.dependencies = dependencies
        
        super.init(view: ArtistDetailsView())
    }
    
    override func setupProperties() {
        super.setupProperties()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArtistDetails(withArtistId: artistId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let members = artistDetails?.members {
            return members.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "defaultCell")
        if let artistDetails = artistDetails, let members = artistDetails.members {
            cell.textLabel?.text = members[indexPath.row].name
            cell.detailTextLabel?.text = members[indexPath.row].active ? .localized("artist.member.active") : .localized("artist.member.inactive")
        }
        
        return cell
    }
    
    private func getArtistDetails(withArtistId artistId: Int) {
        dependencies.apiClient.perform(request: ArtistRequest(artistId: artistId)) { [unowned self] result in
                switch result {
                    case .success(let response):
                        if let data = response.data {
                            let decoder = JSONDecoder()
                            do {
                                let artistDetails = try decoder.decode(ArtistDetails.self, from: data)
                                self.artistDetails = artistDetails
                                DispatchQueue.main.async {
                                    self.customView.tableView.reloadData()
                                    self.distribute(withArtistDetails: artistDetails)
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
    
    private func distribute(withArtistDetails artistDetails: ArtistDetails) {
        customView.profileLabel.text = artistDetails.profile
    }
}
