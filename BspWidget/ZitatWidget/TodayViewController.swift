//
//  TodayViewController.swift
//  ZitatWidget
//
//  Created by Christian Bleske on 06.11.14.
//  Copyright (c) 2014 Christian Bleske. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    var timer:Timer?
    
    let zitate = ["Heimisch in der Welt wird man nur durch Arbeit. Wer nicht arbeitet, ist heimatlos. - Berthold Auerbach",
        "Gib blind, nimm sehend. - Dt. Sprichwort", "Die kürzesten Wörter, nämlich 'ja' und 'nein' erfordern das meiste Nachdenken. - Pythagoras von Samos", "Es gehört oft mehr Mut dazu, seine Meinung zu ändern, als ihr treu zu bleiben. - Friedrich Hebbel"]
    
    @IBOutlet weak var uiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(TodayViewController.updateZitat), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        updateZitat()
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func getRandomNumber(_ min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func updateZitat() {
        let rnd = getRandomNumber(0, max: 3)
        self.uiLabel.text = zitate[rnd]
    }
    
}
