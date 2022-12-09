import UIKit

class ActorCell: UITableViewCell {
    
    
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorKnownFor: UILabel!
    @IBOutlet weak var actorPopularity: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    
    func setActor (_ actor: Actors) {
        actorName.text = actor.name
        actorKnownFor.text = actor.knownForDepartament
        actorPopularity.text = String(actor.popularity)
        guard let actorImageCheck = actor.actorImage ,let url = URL(string: actor.imageUrl.appending(actorImageCheck)) else {actorImage.image = UIImage(named: "no image"); return}
        actorImage.loadImage(url: url)
    }
}
