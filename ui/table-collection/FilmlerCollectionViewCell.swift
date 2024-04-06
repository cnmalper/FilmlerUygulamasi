//
//  FilmlerCollectionViewCell.swift
//  FilmlerUygulamasi
//
//  Created by Alper Canımoğlu on 5.04.2024.
//

import UIKit

protocol CellProtocol {
    func sepeteEkle(indexPath: IndexPath)
}

class FilmlerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filmlerImageView: UIImageView!
    @IBOutlet weak var filmlerLabel: UILabel!
    @IBOutlet weak var sepeteEkleButtonOutlet: UIButton!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        cellProtocol?.sepeteEkle(indexPath: indexPath!)
    }
}
