import UIKit

class PlayersCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamDivision: UILabel!
    @IBOutlet var teamLocation: UILabel!
    @IBOutlet var teamConference: UILabel!
    
    func configure(with team: Team) {
        self.teamName.text = team.team.name ?? "Команда не найдена"
        self.teamDivision.text = team.team.division ?? "Дивизион не найден"
        self.teamLocation.text = team.team.location ?? "Локация не найдена"
        self.teamConference.text = team.team.conference ?? "Конференция не найдена"
        
        DispatchQueue.global().async {
            guard let image = team.team.image else { return }
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imagePlayer.image = UIImage(data: imageData)
            }
        }
    }
    
}
