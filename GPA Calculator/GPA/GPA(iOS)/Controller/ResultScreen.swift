import UIKit

class ResultScreen: UIViewController {
    
    @IBOutlet weak var ResultText: UILabel!
    @IBAction func ButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    var finalGPA: Double? // This will be passed from the previous screen

    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = finalGPA {
            // Format the double to 2 decimal places
            ResultText.text = "Required: \(String(format: "%.2f", result))"
        } else {
            ResultText.text = "GPA calculation failed."
        }
    }
}
