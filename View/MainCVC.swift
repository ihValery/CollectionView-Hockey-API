import UIKit

class MainCVC: UICollectionViewController {
    
    let itemsPerRow: CGFloat = 3
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    let player = ["player1", "player2", "player4", "player5",
                  "player6", "player7", "player8", "player9", "player10",
                  "player11", "player12", "player13", "player14", "player15",
                  "player16", "player17", "player18", "player19", "player20",
                  "player21", "player22", "player23", "player24", "player25",
                  "player26", "player27", "player28", "player29", "player30"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAbout" {
            let aboutVC = segue.destination as! AboutVC
            //Убеждаюсь что могу добраться до ячейки с которой осуществляеться переход
            //sender - тоесть мы и есть
            let cell = sender as! PlayersCell
            aboutVC.image = cell.imagePlayer.image
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return player.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as! PlayersCell

        let imageName = player[indexPath.item]
        let image = UIImage(named: imageName)
        cell.imagePlayer.image = image
    
        //Дизайн ячейки
        cell.contentView.layer.cornerRadius = 9
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
/*
    //Еще один способ настройки дизайна наших элементов
    func setDesign() -> Void {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 70, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
*/
}

extension MainCVC: UICollectionViewDelegateFlowLayout {
    //Размер наших элементов
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddigWidht = sectionInserts.top * (itemsPerRow + 1)
        //Доступная ширина - относительно ширины рамки collectionView
        let availableWigth = collectionView.frame.width - paddigWidht
        let widhtPerItem = availableWigth / itemsPerRow
        return CGSize(width: widhtPerItem, height: widhtPerItem)
    }
    //Отступ от рамки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    //Горизонтальный отспут между элементами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.top
    }
    //Вертикальный отступ между элементами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.top
    }
}
