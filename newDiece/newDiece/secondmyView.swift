//
//  secondmyView.swift
//  newDiece
//
//  Created by yusuf ariturk on 1/5/23.
//

import UIKit

class secondmyView: UIViewController {
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var labelShow: UILabel!
    
    
    var result : Bool?
    //-----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

  
        
        
        // yukarıdaki geri dön ekranını gizleme kodu
        self.navigationItem.hidesBackButton = true
        
        print(result!)
        
        if result! {
            
            labelShow.text = "congratulations you won"
            imageShow.image = UIImage(named: "happyImages")
            
        } else {
            labelShow.text = "unfortunately you lost"
            imageShow.image = UIImage(named: "sadImages")
            
        }
        
        
    }
    
    @IBAction func buttonPlayGameAgain(_ sender: Any) {
        
//        navigationController?.popViewController(animated: true)
        
    }
    
        

}
