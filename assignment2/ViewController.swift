import UIKit

class ViewController: UIViewController {

    var firstName: String?
    var lastName: String?
    var country: String?
    var age: Int?

    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var countryNameText: UITextField!
    @IBOutlet weak var ageNumberText: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!


    @IBOutlet weak var invisibleLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        // Display user information
        if let userInfo = getUserInfo() {
            invisibleLabel.text = "Name: \(userInfo.0 ) \(userInfo.01) \n Country: \(userInfo.2) \n Age: \(userInfo.3)"
            displayUserInfo(userInfo)
        }
    }
 
    @IBAction func submitButton(_ sender: Any) {
        if let userInfo = getUserInfo() {
            invisibleLabel.text = "Data Submited"
            displayUserInfo((userInfo.0, userInfo.1, userInfo.2, userInfo.3))
        } else {
            invisibleLabel.text = "Complete the missing Info!"
        }
    }

    @IBAction func clearButton(_ sender: Any) {
        // Clear all forms
        firstNameText.text = ""
        lastNameText.text = ""
        countryNameText.text = ""
        ageNumberText.text = ""
        invisibleLabel.text = ""
    }


    func getUserInfo() -> (String, String, String, Int)? {
        // Retrieve user information from text fields
        guard let firstName = firstNameText.text,
              let lastName = lastNameText.text,
              let country = countryNameText.text,
              let ageString = ageNumberText.text,
              let age = Int(ageString) else {
            return nil
        }

        return (firstName, lastName, country, age)
    }

    func displayUserInfo(_ userInfo: (String, String, String, Int)) {
        print("First Name: \(userInfo.0)")
        print("Last Name: \(userInfo.1)")
        print("Country: \(userInfo.2)")
        print("Age: \(userInfo.3)")
    }
}
