//
//  ViewController.swift
//  CollectionView_Photo
//
//  Created by Anand on 10/12/17.
//  Copyright © 2017 Rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    var array = ["1", "2", "3", "4", "5", "6"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        CollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 3
        
        cell.imageView.image = UIImage(named: array[indexPath.row])
        cell.imageView.contentMode = .scaleAspectFill
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            if let indexPath = CollectionView?.indexPath(for: sender as! CustomCell) {
                let controller = segue.destination as! photoShow
                guard let imageSelected = UIImage(named: array[indexPath.item]) else {
                    return
                }
                controller.getImage = imageSelected
            }
        }
    }

}



extension ViewController: UICollectionViewDelegateFlowLayout{
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width;
        var itemWidth = collectionWidth / 2 - 1;
        
        if(UI_USER_INTERFACE_IDIOM() == .pad) {
            itemWidth = collectionWidth / 4 - 1;
        }
        return CGSize(width: itemWidth, height: itemWidth);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

