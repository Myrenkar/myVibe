//
//  ArtistDetailsViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class ArtistDetailsViewController: ViewController<ArtistDetailsView> {
    private let dependencies: ApplicationDependenciesProvider
    private let artistId: Int
    
    init(artistId: Int, dependencies: ApplicationDependenciesProvider) {
        self.artistId = artistId
        self.dependencies = dependencies
        
        super.init(view: ArtistDetailsView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArtistDetails(withArtistId: artistId)
    }
    
    private func getArtistDetails(withArtistId artistId: Int) {
        dependencies.apiClient.perform(request: ArtistRequest(artistId: artistId)) { [unowned self] result in
                switch result {
                    case .success(let response):
                        if let data = response.data {
                            let decoder = JSONDecoder()
                            do {
                                let artistDetails = try decoder.decode(ArtistDetails.self, from: data)
                                DispatchQueue.main.async {
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
