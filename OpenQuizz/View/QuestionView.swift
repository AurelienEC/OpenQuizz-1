//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Stephane Gabillet on 14/10/2019.
//  Copyright © 2019 Stephane Gabillet. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    enum Style {
        case correct, incorrect, standard
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
            icon.image = UIImage(named: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            backgroundColor = #colorLiteral(red: 0.9541218877, green: 0.5279667974, blue: 0.5800661445, alpha: 1) // utilisation de Color Literal pour choisir la couleur
            icon.image = #imageLiteral(resourceName: "Icon Error") // Utilisation de Image Literal pour choisir l'icone
            icon.isHidden = false
        case .standard:
            backgroundColor = #colorLiteral(red: 0.7511253953, green: 0.7689308524, blue: 0.785865128, alpha: 1)
            icon.isHidden = true
        }
    }
    
    
    var title = "" {
        didSet {
            label.text = title
        }
    }
    
    
    
    
}
