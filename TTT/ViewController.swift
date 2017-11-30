import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    var game = [
        [0,0,0],
        [0,0,0],
        [0,0,0],
        ]
    var player = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        game = [
            [0,0,0],
            [0,0,0],
            [0,0,0],
        ]
        for button in buttons {
            button.backgroundColor = .lightGray
        }
        player = 1
        infoLabel.isHidden = true
    }
    
    
    func checkWinner(){
        var winner = 0
        var sum = 0
        
        //          cols
        for col in game {
            sum = col.reduce(0, +)
            if sum == 3 { winner = 1}
            else if sum == -3 { winner = -1}
        }
        
        
        //          rows
        for x in 0...2 {
            let a = game[0][x]
            let b = game[1][x]
            let c = game[2][x]
            sum = a + b + c
            print(sum)
            if sum == 3 { winner = 1}
            else if sum == -3 { winner = -1}
        }
        
        sum = game[0][0] + game[1][1] + game[2][2]
        if sum == 3 {winner = 1}
        else if sum == -3 {winner = -1}
        
        sum = game[2][0] + game [1][1] + game[0][2]
        if sum == 3 {winner = 1}
        else if sum == -3 {winner = -1}
        
        
        if winner == 1 {
            infoLabel.text = "Blue Won!"
            infoLabel.isHidden = false
        } else if winner == -1 {
            infoLabel.text = "Red Won!"
            infoLabel.isHidden = false
        }
        if winner != 0 {
            game = [
                [1,1,1],
                [1,1,1],
                [1,1,1],
            ]
            //already pressed so doesnt work
        }
    }
    
    
    @IBAction func butthonPressed(_ sender: UIButton){
        var tagstr = String(format:"%02d", sender.tag)
        print(tagstr)
        let x = Int(String(Array(tagstr.characters)[0]))!
        let y = Int(String(Array(tagstr.characters)[1]))!
        
        if game[x][y] == 0 {
            game[x][y] = player
            var color:UIColor
            if player == 1 { color = .blue}
            else {color = .red}
            sender.backgroundColor = color
            //change the background color
            
            checkWinner()
            
            if player == 1 { player = -1}
            else { player = 1 }
        }
        
    }
}
