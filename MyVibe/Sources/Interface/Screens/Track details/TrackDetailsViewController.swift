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
    
    init(album: Album) {
        self.album = album
        super.init(view: TrackDetailsView())
    }
    
    
    
}
