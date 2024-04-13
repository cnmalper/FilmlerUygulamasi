//
//  ViewController.swift
//  FilmlerUygulamasi
//
//  Created by Alper Canımoğlu on 5.04.2024.
//

import UIKit

class AnaSayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    var filmlerListesi = [Filmler]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        _ = viewModel.filmlerListesi.subscribe(onNext: { liste in
            self.filmlerListesi = liste
            self.filmlerCollectionView.reloadData()
        })
    }
    
    func setupCollectionView() {
        
        filmlerCollectionView.dataSource = self
        filmlerCollectionView.delegate = self
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        // 10x10x10->30
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.67)
        
        filmlerCollectionView.collectionViewLayout = tasarim
    }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilmDetail" {
            if let film = sender as? Filmler {
                let detailVC = segue.destination as! FilmlerDetailViewController
                detailVC.film = film
            }
        }
    }
}

extension AnaSayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        let cell = filmlerCollectionView.dequeueReusableCell(withReuseIdentifier: "filmlerCell", for: indexPath) as! FilmlerCollectionViewCell
        cell.filmlerImageView.image = UIImage(named: film.resim!)
        cell.filmlerImageView.layer.cornerRadius = 10
        cell.filmlerLabel.text = "\(film.fiyat!)$"
        cell.sepeteEkleButtonOutlet.layer.cornerRadius = 10
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toFilmDetail", sender: film)
    }
}

