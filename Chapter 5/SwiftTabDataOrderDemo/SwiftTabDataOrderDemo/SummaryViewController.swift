
import UIKit

class SummaryViewController: UIViewController {
    var myOrder = OrderModel()
    @IBOutlet weak var pieOrder: UILabel!
    @IBOutlet weak var pizzaOrder: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        pieOrder.text = myOrder.pie
        pizzaOrder.text = myOrder.pizza
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myOrder = (tabBarController
            as! OrderTabController).myOrder
    }
}