import UIKit

class AboutVC: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var aboutImage: UIImageView!
    @IBOutlet weak var forGradientButton: UIView!
    @IBOutlet weak var buttonShared: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutImage.image = image
        setDesign()
        setMyDesignButton()
        
    }
    @IBAction func sharedAction(_ sender: Any) {
        
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        //Отслеживание - успешно или не успешно доставлен мой файл
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Успешно!")
            }
        }
        //Отобразить любой контроллер можно с помощью функции present
        present(shareController, animated: true, completion: nil)
    }
    
    func setDesign() -> Void {
        aboutImage.layer.masksToBounds = false
        aboutImage.layer.shadowColor = UIColor.black.cgColor
        aboutImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        aboutImage.layer.shadowRadius = 4
        aboutImage.layer.shadowOpacity = 0.4
    }
    
    func setMyDesignButton() {
            // Создание градиентного слоя
            let gradient = CAGradientLayer()
            // Градиентные цвета в том порядке, в котором они будут визуально отображаться
            gradient.colors = [UIColor.purple.cgColor, UIColor.black.cgColor]
            // Градиент слева направо
            gradient.startPoint = CGPoint(x: 0.3, y: 0.3)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            // Установка градиентного слоя того же размера, что и myView
            gradient.frame = forGradientButton.bounds
            // Добавление градиентного слоя к слою myView для рендеринга
            forGradientButton.layer.insertSublayer(gradient, at: 0)
            // Волшебство! Установка кнопки в качестве маски myView
            forGradientButton.mask = buttonShared
            // Установка радиуса угла и ширины границы кнопки
            buttonShared.layer.cornerRadius = 9
            buttonShared.layer.borderWidth = 2
        }

    
}
