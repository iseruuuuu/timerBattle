//
//  ViewController.swift
//  timerBattle
//
//  Created by user on 2020/10/09.
//リセットを押した時に戻らない。


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var timerLabel2: UILabel!
    @IBOutlet weak var startButton2: UIButton!
    @IBOutlet weak var resetButton2: UIButton!
    @IBOutlet weak var stopButton2: UIButton!
    
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var elapsedTime: Double = 0.0
    
    var startTime2: TimeInterval? = nil
    var timer2 = Timer()
    var elapsedTime2: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // start = true   stop = false   reset  = false
        setButtonEnable(start: true, stop: false, reset: false)
        setButtonEnable2(start: true, stop: false, reset: false)
        
        startButton2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        stopButton2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        resetButton2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
    
    }

    func setButtonEnable(start: Bool, stop: Bool, reset: Bool) {
        self.startButton.isEnabled = start
        self.stopButton.isEnabled = stop
        self.resetButton.isEnabled = reset
        
    }
    
    func setButtonEnable2(start: Bool, stop: Bool, reset: Bool) {
        self.startButton2.isEnabled = start
        self.stopButton2.isEnabled = stop
        self.resetButton2.isEnabled = reset
        
    }

    
    @objc func update() {
    //print(Date.timeIntervalSinceReferenceDate)
        if let startTime = self.startTime {
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime + self.elapsedTime
            let min = Int(t / 60)
            let sec = Int(t) % 60
            let msec = Int(t * 100) % 100
            let mmsec = Int(t * 100 * 100) % 100
            let mmmsec = Int(t * 100 * 100 * 100) % 100
            let mmmmsec = Int(t * 100 * 100 * 100 * 100) % 100
            let mmmmmsec = Int(t * 100 * 100 * 100 * 100 * 100) % 100
            let mmmmmmsec = Int(t * 100 * 100 * 100 * 100 * 100 * 100) % 100
           
            self.timerLabel.text = String(format: "%02d:%02d:%02d:%02d:%02d:%02d:%02d:%02d", min, sec, msec, mmsec,mmmsec,mmmmsec, mmmmmsec, mmmmmmsec)
            
            
        }
    }
    
    
    @objc func update2() {
       if let startTime2 = self.startTime2 {
           let t: Double = Date.timeIntervalSinceReferenceDate - startTime2 + self.elapsedTime2
           let min2 = Int(t / 60)
           let sec2 = Int(t) % 60
           let msec2 = Int(t * 100) % 100
           let mmsec2 = Int(t * 100 * 100) % 100
           let mmmsec2 = Int(t * 100 * 100 * 100) % 100
           let mmmmsec2 = Int(t * 100 * 100 * 100 * 100) % 100
           let mmmmmsec2 = Int(t * 100 * 100 * 100 * 100 * 100) % 100
           let mmmmmmsec2 = Int(t * 100 * 100 * 100 * 100 * 100 * 100) % 100
          
           self.timerLabel2.text = String(format: "%02d:%02d:%02d:%02d:%02d:%02d:%02d:%02d", min2, sec2, msec2, mmsec2,mmmsec2,mmmmsec2, mmmmmsec2, mmmmmmsec2)
           
            
            
        }
    }
    

    
    @IBAction func startTimer(_ sender: Any) {
        // start = false   stop = true   reset  = false
       // timerLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        setButtonEnable(start: false, stop: true, reset: false)
        self.startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(
        timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        // start = true   stop = false   reset  = true
         timerLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        setButtonEnable(start: false, stop: false, reset: true)
        if let startTime = self.startTime {
            self.elapsedTime += Date.timeIntervalSinceReferenceDate - startTime   }
        self.timer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        // start = true   stop = false   reset  = false
        // timerLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        self.timerLabel.transform = .identity
        
        setButtonEnable(start: true, stop: false, reset: false)
        self.startTime = nil
        self.timerLabel.text = "00:00:00:00:00:00:00:00"
        self.elapsedTime = 0.0
    }

    
    
    
    @IBAction func startTimer2(_ sender: Any) {
        //              start: false  stop: true  reset: false
       timerLabel2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
       setButtonEnable2(start: false, stop: true, reset: false)
       self.startTime2 = Date.timeIntervalSinceReferenceDate
       
       self.timer2 = Timer.scheduledTimer(
           timeInterval: 0.01,
           target: self,
           selector: #selector(self.update2),
           userInfo: nil,
           repeats: true)
    }
    
    @IBAction func stopTimer2(_ sender: Any) {
        //start: true, stop: false reset: true
        timerLabel2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        setButtonEnable2(start: false, stop: false, reset: true)
        if let startTime2 = self.startTime2 {
            self.elapsedTime2 += Date.timeIntervalSinceReferenceDate - startTime2
        }
        self.timer2.invalidate()
    }
    
    @IBAction func resetTimer2(_ sender: Any) {
        //   start: true  stop: false  reset: false
      setButtonEnable2(start: true, stop: false, reset: false)
      self.startTime2 = nil
      self.timerLabel2.text = "00:00:00:00:00:00:00:00"
      self.elapsedTime2 = 0.0
    }
    
    
}

