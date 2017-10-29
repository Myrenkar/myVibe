//
//  TrackDetailsViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class TrackDetailsVieWController: ViewController<TrackDetailsView> {
    let album: Album
    let imageDownloader: RemoteImageDownloader
    
    init(album: Album) {
        self.album = album
        self.imageDownloader = RemoteImageDownloader()
        
        super.init(view: TrackDetailsView())
    }
    
    override func setupProperties() {
        super.setupProperties()
        
        customView.stylesLabel.text = album.style?.joined(separator: "\n")
        customView.typeLabel.text = album.type
        customView.titleLabel.text = album.title
        
        if let urlString = album.thumb, let imageURL = URL(string: urlString) {
            imageDownloader.downloadImage(withURL: imageURL, completionHandler: { [unowned self] result in
                switch result {
                    case .success(let image):
                        self.customView.imageView.image = image
                    default:
                        break
                }
            })
        }
        
    }
    
}
