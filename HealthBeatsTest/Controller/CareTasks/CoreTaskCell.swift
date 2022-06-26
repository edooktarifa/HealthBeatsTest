//
//  CoreTaskCell.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import UIKit

class CoreTaskCell: UITableViewCell {

    @IBOutlet weak var backgroundCoreView: UIView!{
        didSet {
            backgroundCoreView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var addResultBtn: UIButton! {
        didSet {
            DispatchQueue.main.async {
                self.addResultBtn.layer.cornerRadius = self.addResultBtn.layer.frame.height / 2
            }
            
        }
    }
    
    var showPopUpAddResult: (() -> Void)?
        
    @IBAction func didClickAddResult(_ sender: UIButton){
        showPopUpAddResult?()
    }
    
    @IBOutlet weak var setDateCore: UILabel! {
        didSet {
            let mytime = Date()
            let format = DateFormatter()
            format.dateFormat = "dd MMMM yyyy"
            
            setDateCore.text = format.string(from: mytime)
        }
    }
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var setTitle: UILabel!
    @IBOutlet weak var setSubTitle: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    var fontFirstShow: Bool? = false
    
    func setContent(){
       
        if fontFirstShow == true {
            setDateCore.setSizeFont(sizeFont: 14)
            headerLbl.setSizeFont(sizeFont: 25)
            setTitle.setSizeFont(sizeFont: 14)
            setSubTitle.setSizeFont(sizeFont: 24)
            descLbl.setSizeFont(sizeFont: 13)
            detailLbl.setSizeFont(sizeFont: 14)
            addResultBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        }
    }
}

extension UILabel {
    func setSizeFont(sizeFont: Double) {
        self.font =  UIFont(name: self.font.fontName, size: sizeFont)!
        self.sizeToFit()
    }
}
