//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Faizan KHan on 4/2/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var blogLabel: UITextView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change navigation bar title color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let post = post {
            // Populate UI elements with post data
            if let photo = post.photos.first {
                let url = photo.originalSize.url
                // Load image asynchronously
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async { [weak self] in
                            self?.blogImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
            // Remove HTML tags from post.caption
            let captionWithoutHTML = post.caption.stringByStrippingHTML()
            blogLabel.text = captionWithoutHTML
        }
    }
}

extension String {
    func stringByStrippingHTML() -> String {
        return replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
