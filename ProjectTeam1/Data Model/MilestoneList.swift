import Foundation
import UIKit

class DataPertanyaan: NSObject {
    
    static let shared = DataPertanyaan()
    
    struct Bayi {
        var umur: Int
        var gambar: UIImage
        var pertanyaan: [String]
        var done: [Bool]
    }
    
    var babyArray: [Bayi] = []
    
    func loadData() {
        
        // bayi satu bulan
        let satuBulanGM = Bayi(umur: 1, gambar: UIImage(named: "domain1")!, pertanyaan: grossMotorSatuBulan, done: [false, false])
        babyArray.append(satuBulanGM)
        
        let satuBulanMH = Bayi(umur: 1, gambar: UIImage(named: "domain2")!, pertanyaan: softMotorDuaBulan, done: [false])
        babyArray.append(satuBulanMH)
        
        let satuBulanKM = Bayi(umur: 1, gambar: UIImage(named: "domain3")!, pertanyaan: kemandirian1, done: [false])
        babyArray.append(satuBulanKM)
        
        let satuBulanMM = Bayi(umur: 1, gambar: UIImage(named: "domain4")!, pertanyaan: mM1, done: [false, false])
        babyArray.append(satuBulanMM)
        
        let satuBulansE1 = Bayi(umur: 1, gambar: UIImage(named: "domain5")!, pertanyaan: sE1, done: [false, false])
        babyArray.append(satuBulansE1)
        
        let satuBulanBR1 = Bayi(umur: 1, gambar: UIImage(named: "domain6")!, pertanyaan: bR1, done: [false])
        babyArray.append(satuBulanBR1)
        
        let satuBulanBE1 = Bayi(umur: 1, gambar: UIImage(named: "domain7")!, pertanyaan: bE1, done: [false])
        babyArray.append(satuBulanBE1)
    }

    // daftar milestone
    let grossMotorSatuBulan = ["Tengkurap dengan dagu naik", "Menoleh/menengok dalam posisi telentang"]
    let softMotorDuaBulan = ["Mengepalkan tangan dekat wajah"]
    let kemandirian1 = ["Dapat menghisap dengan lancar"]
    let mM1 = ["Memandangi benda hitam-putih", "Mengikuti gerakan wajah orang lain"]
    let sE1 = ["Mengenali suara Ibunya", "Menangis saat tidak nyaman"]
    let bR1 = ["Kaget saat mendengar suara"]
    let bE1 = ["Mengeluarkan suara tenggorokan"]
    
    
}
