

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var PlayingCardView: PlayingCardView!
    {
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            PlayingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: PlayingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            PlayingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard()
    {
        if let card = deck.draw(){
            PlayingCardView.rank = card.rank.order
            PlayingCardView.suit = card.suit.rawValue
            PlayingCardView.isFaceUp = true
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer)
    {
        PlayingCardView.isFaceUp = !PlayingCardView.isFaceUp
    }
    
    @IBAction func justNextCard(_ sender: UILongPressGestureRecognizer)
    {
        switch sender.state{
        case .ended:
            do {
                if PlayingCardView.isFaceUp != false
                {
                    if PlayingCardView.rank != 13
                    {
                        PlayingCardView.rank = PlayingCardView.rank+1
                    }
                    else
                    {
                        PlayingCardView.rank=1
                    }
                }
            }
        default: break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}

