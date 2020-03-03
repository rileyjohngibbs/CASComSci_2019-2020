import UIKit

class picViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
        // Do any additional setup after loading the view.
    }

    
    func loadPhotos(){
        let pictures = images.map({(image) -> UIImageView in
            let newImageView = UIImageView()
            newImageView.image = image
            newImageView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
            return newImageView
        })
        let count = images.count
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: count*600)
        scrollView.contentSize = CGSize(width: 400, height: count*600)
        for (_, image) in pictures.enumerated() {
            stackView.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: pictures[0], attribute: .height, multiplier: 1, constant: 1)
            if image != pictures[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
}
