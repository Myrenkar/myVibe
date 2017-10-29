//
//  TrackDetailsViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class TrackDetailsVieWController: ViewController<TrackDetailsView> {
    private let trackId: Int
    private var artistId: Int?
    private let dependencies: ApplicationDependenciesProvider
    private let imageDownloader: RemoteImageDownloader
    
    init(trackId: Int, dependencies: ApplicationDependenciesProvider) {
        self.trackId = trackId
        self.dependencies = dependencies
        self.imageDownloader = RemoteImageDownloader()
        
        super.init(view: TrackDetailsView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetails()
    }
    
    override func setupProperties() {
        super.setupProperties()
        customView.artistsButton.addTarget(self, action: #selector(showArtistDetails), for: .touchUpInside)
    }
    
    private func getDetails() {
        dependencies.apiClient.perform(request: ReleasesRequest(releaseId: self.trackId)) { [unowned self] result in
            switch result {
                case .success(let response):
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        do {
                            let release = try decoder.decode(Release.self, from: data)
                            DispatchQueue.main.async {
                                self.distribute(withRelease: release)
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
    
    private func distribute(withRelease release: Release) {
        customView.stylesLabel.text = release.styles?.joined(separator: "\n")
        customView.yearLabel.text = release.released
        customView.titleLabel.text = release.title
        
        if let artist = release.artists.first {
            self.artistId = artist.id
            title = artist.name
        }
        
        if let thumb = release.thumb, let thumbURL = URL(string: thumb) {
            loadImage(withURL: thumbURL)
        }
    }
    
    private func loadImage(withURL url: URL) {
        imageDownloader.downloadImage(withURL: url, completionHandler: { [unowned self] result in
            switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.customView.imageView.image = image
                    }
                default:
                    break
            }
        })
    }
    
    @objc private func showArtistDetails() {
        if let artistId = self.artistId {
            let artistDetailsViewController  = ArtistDetailsViewController(artistId: artistId, dependencies: self.dependencies)
            navigationController?.pushViewController(artistDetailsViewController, animated: true)

        }
    }
}
