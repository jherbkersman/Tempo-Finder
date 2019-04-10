//
//  ViewController.swift
//  Tempo Finder
//
//  Created by Jack Herbkersman on 4/10/19.
//  Copyright © 2019 AppJack. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet weak var CurrentTempo: NSTextField!
    
    var Time:Double = 0
    var Tempo:Int32 = 0
    var Tempos = [Int32]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func TapMetronomeAction(_ sender: NSButton) {
        timeUpdate()
    }
    
    
    func printNewTime(){
        CurrentTempo.intValue = Tempo
    }
    
    func timeUpdate(){
        if Time != 0{
            let oldTime = Time
            let currentDate = Date()
            Time = currentDate.timeIntervalSince1970
            Tempo = Int32(round(60/(Time - oldTime)))
            if Tempos.count < 10{
                Tempos.append(Tempo)
                Tempo = Int32(round(Float(Tempos.reduce(0, +)) / Float(Tempos.count)))
            }
            else{
                Tempos.removeFirst()
                Tempos.append(Tempo)
                Tempo = Int32(round(Float(Tempos.reduce(0, +)) / Float(Tempos.count)))
            }
            printNewTime()
        }
        if Time == 0{
            let currentDate = Date()
            Time = currentDate.timeIntervalSince1970
        }

    }
    
}

