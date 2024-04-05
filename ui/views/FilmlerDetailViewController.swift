//
//  FilmlerDetailViewController.swift
//  FilmlerUygulamasi
//
//  Created by Alper Canımoğlu on 5.04.2024.
//

import UIKit

class FilmlerDetailViewController: UIViewController {

    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmPriceLabel: UILabel!
    
    var film: Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmImageView.layer.cornerRadius = 10

        if let f = film {
            
            filmNameLabel.text = f.ad
            filmImageView.image = UIImage(named: f.resim!)
            filmPriceLabel.text = "\(f.fiyat!)$"
        }
        
    }
}
