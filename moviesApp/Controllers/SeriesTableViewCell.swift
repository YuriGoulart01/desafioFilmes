import UIKit

class SeriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serieImage: UIImageView!
    @IBOutlet weak var serieTitle: UILabel!
    @IBOutlet weak var serieLaunchDate: UILabel!
    @IBOutlet weak var serieMediaNote: UILabel!
    @IBOutlet weak var serieVoteCount: UILabel!
    @IBOutlet weak var serieResume: UILabel!
    
    func setSeries (_ serie: Series) {
        serieTitle.text = serie.title
        serieLaunchDate.text = serie.releaseDate
        serieMediaNote.text = String(serie.voteAverage)
        serieVoteCount.text = String(serie.voteCount)
        serieResume.text = serie.resume
        guard let url = URL(string: serie.imageUrl.appending(serie.imageLinkId)) else {return}
        serieImage.load(url: url)
    }
}
