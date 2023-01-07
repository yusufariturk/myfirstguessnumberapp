//
//  FirstmyViewViewController.swift
//  newDiece
//
//  Created by yusuf ariturk on 1/5/23.
//

import UIKit

class FirstmyViewViewController: UIViewController {
    @IBOutlet weak var labelReamingGuess: UILabel!
    @IBOutlet weak var labelSupport: UILabel!
    @IBOutlet weak var textFieldSing: UITextField!
    
    
    // burada makinanın üreteceği int verisini oluşturuyoruz
    var randomNumber : Int?
    // kalan hakkımızı belirliyoruz
    var remainder = 5
    
    
    
    
    
    //--------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // burada 100'e kadar sayı üreteceğiz makina üretecek
        // randomNumber = Int(arc4random_uniform(100))
        
        randomNumber = Int.random(in: 1...100)
        print("tahmin rakam : \(randomNumber!)")
        
        
    }
    
    
    // Bunu kendim yazdım sonuç için gidilecek ekran kodlaması buradan yazılıyor
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender    as?  Bool {
            let gidilecekVC = seque.destination as! secondmyView
            
            gidilecekVC.result = gelenVeri
        }
    }
    
    
    //Button--------------------
    @IBAction func buttonLetsGuess(_ sender: Any) {
        
        // BUTTON İŞLEMLERİ
        // Burada label yazımızı gizledik basınca görünecek bize
        
        labelSupport.isHidden = false
        
        // burada her buttona basınca bir can azalacak
        remainder -= 1
        
        
        
        // burada text fielde girileni int çeviriyoruz
        if let veri =   textFieldSing.text{
            if let guess = Int(veri) {
                
                
                // Burada girilen sayı 0 değil ise
                if randomNumber != 0 {
                    
                    
                    // Burada eğer sayıyı bilirsen ne yapacaksın
                    if  guess == randomNumber! {
                        let result = true
                        
                        // performSeque yazdın mı çıkacak kod parçası bu
                        // tahminToSonuc bizim main de bağladığımız okun ismi
                        // bu kodu sonuca göre karşıya geçmesini sağlıyoruz
                        performSegue(withIdentifier: "tahminToSonuc", sender: result)
                        return
                        
                    }
                    // tahmin ettiğin numaradan küçük
                    if guess < randomNumber! {
                        labelSupport.text = "you should increase the number"
                        labelReamingGuess.text = "your remaining life : \(remainder)"
                    }
                    
                    // tahmin ettiğin numaradan büyük
                    if guess > randomNumber! {
                        labelSupport.text = "you should reduce the number"
                        labelReamingGuess.text = "your remaining life : \(remainder)"
                    }
                    
                    
                    
                    
                    
                    if (remainder) == 0 {
                        // int değil ise
                        // performSeque yazdın mı çıkacak kod parçası bu
                        // tahminToSonuc bizim main de bağladığımız okun ismi
                        // bu kodu sonuca göre karşıya geçmesini sağlıyoruz
                        let result = false
                        performSegue(withIdentifier: "tahminToSonuc", sender: result)
                        
                        
                    }
                    
                    // Burada kulanıcı string girerse
                    textFieldSing.text = ""
                    
                    
                }
                
            }
        }
    }
    
    }
