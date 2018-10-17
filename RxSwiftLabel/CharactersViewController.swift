//
//  CharactersViewController.swift
//  RxSwiftLabel
//
//  Created by Руслан Акберов on 17.10.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit
import RxSwift

class CharactersViewController: UIViewController {
    
    private let selectedCharacterVariable = Variable("")
    var selectedCharacter: Observable<String> {
        return selectedCharacterVariable.asObservable()
    }
    
    @IBAction func characterButtonTapped(_ sender: UIButton) {
        guard let character = sender.titleLabel?.text else  { return }
        selectedCharacterVariable.value = character
    }
    
    @IBAction func closeBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
