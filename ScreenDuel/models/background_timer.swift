//
//  background_timer.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 11/4/24.
//

import Foundation
import SwiftUI
import Combine


//improved timer object that accounts for the app state entering background. 
//not sure what would happen if the device is powered off completely
@Observable class BackgroundTimer {
    
    var isRunning = false
    private var startTime: Date //{ didSet { saveStartTime() } }
    private var timer: AnyCancellable?
    private var timerLength: Int
    var secondsRemaining: Int
    
    init(seconds: Int) {
        startTime = Date()
        timerLength = seconds
        secondsRemaining = seconds
    }
    
    func start() {
        timer?.cancel()
        
        
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard
                   let self = self
                else {
                  print("guard failed")
                  return
                }
                
                let now = Date()
                let elapsed = now.timeIntervalSince(startTime)

                guard timerLength - Int(elapsed) > 0  else {
                    isRunning = false
                    self.stop()
                    secondsRemaining = 0
                    return
                }
                secondsRemaining = timerLength - Int(elapsed)
                
            }
        isRunning = true
    }
    
    
    func stop() {
           timer?.cancel()
           timer = nil
    }
    
}


private extension BackgroundTimer {
    /*
    func saveStartTime() {
        if let startTime = startTime {
            UserDefaults.standard.set(startTime, forKey: "startTime")
        } else {
            UserDefaults.standard.removeObject(forKey: "startTime")
        }
    }

    func fetchStartTime() -> Date? {
        UserDefaults.standard.object(forKey: "startTime") as? Date
    }
    */
}
