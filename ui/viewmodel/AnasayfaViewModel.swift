//
//  AnasayfaViewModel.swift
//  FilmlerUygulamasi
//
//  Created by Alper Canımoğlu on 13.04.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var fRepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    init(){ // calistigi anda verileri yuklemem gerekiyor.
        filmlerListesi = fRepo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle() {
        fRepo.filmleriYukle()
    }
}
