//
//  ViewController.swift
//  CarCollectionView
//
//  Created by Iphone XR on 03/12/22.
//

import UIKit

var carNames = ["Bolero","Innova","Lamborghini","Ferrari","Mercedes"]
var carDesc = ["Boléro is a 1928 work for large orchestra by French composer Maurice Ravel. At least one observer has called it Ravel's most famous composition. It was also one of his last completed works before illness forced him into retirement.","In terms of comfort, the Toyota Innova always feels a pricier car than its actual price. Not only Indians, but foreigners are also a big fan of the car.","There are various elements such as automatic climate control, premium leather materials, power seating, air filtration, power features, performance speakers, and LCD monitors.","Ferrari is known around the world as an iconic brand, synonymous with game-changing performance and unparalleled elegance. But before 1939, “Ferrari” meant “Enzo Ferrari,” the founder of the brand and head of the Scuderia Ferrari racing team for Alfa Romeo.","These days, the German brand is best known for its luxury cars, but there's more to it than that. In the world of luxury cars, Mercedes-Benz is one of the most famous and reliable brands. Its amazing designs for sports cars, SUVs, sedans, and other vehicles have had a huge impact on the automobile industry."]


var myIndex = 0  //we see which row our user select create variable for index

class ViewController: UIViewController {
    
    private var collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        //navigationItem.title = "FirstVC"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: 400, height: 200)
        
        collectionView = UICollectionView(frame:  CGRect(x: 0, y: 50, width: 1600, height: 900), collectionViewLayout: layout)
        
        guard let collectionView = collectionView else{
            return
        }
        collectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: "CarCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
       
        }
        
}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionViewCell", for: indexPath) as? CarCollectionViewCell
            cell?.nameLabel.text = carNames[indexPath.row]
       
        return cell!
        }
}
    extension ViewController:UICollectionViewDelegate{
        
    }
    extension ViewController:UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = (collectionView.frame.size.width - 10/1)
            return CGSize(width:400, height: 100)
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //stored indexpath value we assign to myIndex
            myIndex = indexPath.row
            collectionView.deselectItem(at: indexPath, animated: true)  //Selects the item at the specified index path
            let secVC = SecondViewController()
            secVC.descriptionFromFirstVC = carNames[indexPath.row]
            self.navigationController?.pushViewController(secVC, animated: true)
        }

    }
    
    class CarCollectionViewCell: UICollectionViewCell {
        
        static let identifier = "CarCollectionViewCell"
        
        var nameLabel:UILabel!
       
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = .white
            
            nameLabel = UILabel()
            nameLabel.textColor = UIColor.black
            nameLabel.font = UIFont.systemFont(ofSize: 17)
            addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20).isActive = true
            NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
            NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
            }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
//var carnameArray = [["name":"Bolero","id":1,"colour":"blue","price":"10Lakh"],
//                  ["name":"Innova","id":2,"colour":"Red","price":"30Lakh"],
//                  ["name":"Lamborghini","id":3,"colour":"black","price":"90Lakh"],
//                  ["name":"Ferrari","id":4,"colour":"lavender","price":"80Lakh"],
//                  ["name":"Mercedes","id":5,"colour":"yellow","price":"60Lakh"],
//                  ["name":"Jaguar","id":6,"colour":"gray","price":"50Lakh"],
//                  ["name":"Maruti-Suzuki","id":7,"colour":"white","price":"50Lakh"]]
