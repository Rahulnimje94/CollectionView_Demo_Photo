//
//  photoShow.swift
//  CollectionView_Photo
//
//  Created by Anand on 11/12/17.
//  Copyright © 2017 Rahul. All rights reserved.
//

import UIKit

class photoShow: UIViewController {
    
    var getImage: UIImage?
    
    @IBOutlet weak var imagePreview: UIImageView!{
        didSet{
            imagePreview.image = getImage
        }
    }
    
    
}
