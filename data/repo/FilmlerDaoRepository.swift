//
//  FilmlerDaoRepository.swift
//  FilmlerUygulamasi
//
//  Created by Alper Canımoğlu on 13.04.2024. "Dao -> Database Access Object"
//

import Foundation
import RxSwift

class FilmlerDaoRepository {
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    func filmleriYukle() {
        var liste = [Filmler]()
        let f1 = Filmler(id: 1, ad: "anadoluda", resim: "anadoluda", fiyat: 10)
        let f2 = Filmler(id: 2, ad: "django", resim: "django", fiyat: 20)
        let f3 = Filmler(id: 3, ad: "inception", resim: "inception", fiyat: 30)
        let f4 = Filmler(id: 4, ad: "interstellar", resim: "interstellar", fiyat: 40)
        let f5 = Filmler(id: 5, ad: "thehatefuleight", resim: "thehatefuleight", fiyat: 50)
        let f6 = Filmler(id: 6, ad: "thepianist", resim: "thepianist", fiyat: 60)
        
        liste.append(f1)
        liste.append(f2)
        liste.append(f3)
        liste.append(f4)
        liste.append(f5)
        liste.append(f6)
        filmlerListesi.onNext(liste)
    }
}
