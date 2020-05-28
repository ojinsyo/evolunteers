//
//  ProfileViewController.swift
//  EVolunteers
//
//  Created by Dedy Yuristiawan on 12/05/20.
//  Copyright © 2020 Dedy Yuristiawan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var daftarButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNama: UILabel!
    @IBOutlet weak var userStatus: UILabel!
    @IBOutlet weak var userLokasi: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userTTL: UILabel!
    @IBOutlet weak var userJabatan: UILabel!
    
    @IBOutlet weak var userPrograms: UILabel!
    
    let email = PreferenceManager.instance.userEmail ?? ""
    let nama = PreferenceManager.instance.userName ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        daftarButton.layer.borderWidth = 1
        daftarButton.layer.borderColor = UIColor.init(hex: 0x000000).cgColor
        
        profileImage.layer.cornerRadius = 25
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.init(hex: 0x000000).cgColor
        
        usersView()
        get()
        
    }
    
    func usersView(){
        
        userNama.text = nama
        userLokasi.text = ""
        userEmail.text = email
        userPhone.text = ""
        userTTL.text = ""
        userJabatan.text = ""
    }
    
    func get() {
        let predicate = NSPredicate(format: "%K == %@", argumentArray: ["email", email])
        Members.query(predicate: predicate, result: { (foundMembers) in
            if let foundMember = foundMembers?.first {
                let alamat = foundMember.record?.value(forKey: "alamat")
                let phone = foundMember.record?.value(forKey: "mobilePhone")
            }
        }) { (error) in
            print(error)
        }
    }
    
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
}
