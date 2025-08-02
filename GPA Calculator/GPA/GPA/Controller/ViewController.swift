import UIKit

class ViewController: UIViewController {
    
    var gpa = GPA_Data()
    
    @IBOutlet weak var PresentGPA: UITextField!
    @IBOutlet weak var RemainingSem: UITextField!
    @IBOutlet weak var Target: UITextField!
    //    @IBOutlet weak var Card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateRequiredGPA(_ sender: UIButton) {
        guard let presentText = PresentGPA.text,
              let presentGPA = Double(presentText),
              let remainingText = RemainingSem.text,
              let remainingSem = Int(remainingText),
              let targetText = Target.text,
              let targetGPA = Double(targetText) else {
            showAlert(message: "Please enter valid GPA and Semester values.")
            return
        }
        
        if let requiredGPA = gpa.calculateRequiredGPA(presentGPA: presentGPA, remainingSem: remainingSem, targetGPA: targetGPA) {
            print("Required GPA per semester: \(String(format: "%.2f", requiredGPA))")
            
            performSegue(withIdentifier: "Screen2", sender: self)
            // You can also update a label here
        } else {
            showAlert(message: "Remaining semester must be greater than 0.")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Screen2" {
            if let destinationVC = segue.destination as? ResultScreen {
                destinationVC.finalGPA = gpa.Result
            }
        }
    }
}
