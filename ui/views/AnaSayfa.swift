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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        let f1 = Filmler(id: 1, ad: "anadoluda", resim: "anadoluda", fiyat: 10)
        let f2 = Filmler(id: 2, ad: "django", resim: "django", fiyat: 20)
        let f3 = Filmler(id: 3, ad: "inception", resim: "inception", fiyat: 30)
        let f4 = Filmler(id: 4, ad: "interstellar", resim: "interstellar", fiyat: 40)
        let f5 = Filmler(id: 5, ad: "thehatefuleight", resim: "thehatefuleight", fiyat: 50)
        let f6 = Filmler(id: 6, ad: "thepianist", resim: "thepianist", fiyat: 60)
        
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
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

