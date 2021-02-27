import UIKit

class AboutVC: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var aboutImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutImage.image = image

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
    
}
