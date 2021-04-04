//
//  ViewController.swift
//  Sons dos bichos
//
//  Created by Gilberto Silva on 04/04/21.
//

import UIKit
import AVFoundation

private extension String {
    static let dog = "cao"
    static let cat = "gato"
    static let lion = "leao"
    static let monkey = "macaco"
    static let sheep = "ovelha"
    static let cow = "vaca"
    static let audioType = "mp3"
}

class ViewController: UIViewController {
    
    private var animalAudio: AVAudioPlayer? = nil
    
    @IBAction func dogButtonClick(_ sender: UIButton) {
        playAnimalAudio(name: .dog)
    }
    
    @IBAction func catButtonClick(_ sender: UIButton) {
        playAnimalAudio(name: .cat)
    }
    
    @IBAction func lionButtonClick(_ sender: UIButton) {
        playAnimalAudio(name: .lion)
    }
    
    @IBAction func monkeyButtonClick(_ sender: UIButton) {
        playAnimalAudio(name: .monkey)
    }
    
    @IBAction func sheepButtonClick(_ sender: UIButton) {
        playAnimalAudio(name: .sheep)
    }
    
    @IBAction func cowButtonClick(_ sender: UIButton) {
        playAnimalAudio(name: .cow)
    }
    
    private func playAnimalAudio(name: String) {
        do {
            guard
                let url = getUrlByAudioName(name: name)
            else { return }
            let audio = try AVAudioPlayer(contentsOf: url)
            self.animalAudio = audio
            audio.prepareToPlay()
            audio.play()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func getUrlByAudioName(name: String) -> URL? {
        guard let path = Bundle.main.path(forResource: name, ofType: .audioType)
        else { return nil}
        return URL(fileURLWithPath: path)
    }
}

