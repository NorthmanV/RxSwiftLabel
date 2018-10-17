//
//  InitialViewController.swift
//  RxSwiftLabel
//
//  Created by Руслан Акберов on 16/10/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit
import RxSwift

class InitialViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func chooseCharacterButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toCharactersVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let charactersVC = segue.destination as? CharactersViewController else { return }
        charactersVC.selectedCharacter.subscribe {[weak self] (character) in
            self?.helloLabel.text = "Hello \(character)"
        }.disposed(by: disposeBag)
    }
    
}

