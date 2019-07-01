
import Foundation


struct PlayingCard : CustomStringConvertible
{
    var description: String{ return "\(suit)\(rank)"}
    var suit: Suit
    var rank: Rank
    
    enum Suit : String, CustomStringConvertible
    {
        case Spades = "♠️"
        case Hearts = "♥️"
        case Diamonds = "♦️"
        case Clubs = "♣️"
        
        static var all = [Suit.Spades, .Hearts, .Diamonds, .Clubs]

        var description: String
        {
            switch self
            {
                case .Spades: return Suit.Spades.rawValue
                case .Hearts: return Suit.Hearts.rawValue
                case .Diamonds: return Suit.Diamonds.rawValue
                case .Clubs: return Suit.Clubs.rawValue
            }
        }
    }
    
    enum Rank: CustomStringConvertible
    {
        case ace
        case face(String)
        case numeric(pipsCount: Int)
        
        var order: Int
        {   switch self
            {   case .ace: return 1
                case .numeric(let pips): return pips
                case .face(let kind) where kind == "J": return 11
                case .face(let kind) where kind == "Q": return 12
                case .face(let kind) where kind == "K": return 13
                default: return 0
            }
        }
        
        static var all: [Rank]
        {
            var allRanks = [Rank.ace]
            for pips in 2...10
            {
                allRanks.append(Rank.numeric(pipsCount: pips))
            }
            allRanks+=[self.face("J"), self.face("Q"), self.face("K")]
            return allRanks
        }
        var description: String
        {
            switch self{
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
    }
    
}
