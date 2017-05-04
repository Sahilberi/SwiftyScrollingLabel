//
//  ViewController.swift
//  SwiftyScrollingLabel
//
//  Created by Sahil on 03/05/17.
//  Copyright © 2017 SahilBeri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var labelView1: SwiftyScrollingLabel!

  @IBOutlet weak var labelView3: SwiftyScrollingLabel!
  
  @IBOutlet weak var labelView2: SwiftyScrollingLabel!
 
  @IBOutlet weak var labelView4: SwiftyScrollingLabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self.labelView1.startAnimate()
    self.labelView2.startAnimate()
    self.labelView3.startAnimate()
    self.labelView4.startAnimate()
  }
  
  @IBAction func resumeAnimationBtnClicked(_ sender: Any) {
    self.labelView1.resumeAnimate()
    self.labelView2.resumeAnimate()
    self.labelView3.resumeAnimate()
    self.labelView4.resumeAnimate()
  }

  @IBAction func stopAnimationBtnClicked(_ sender: Any) {

    self.labelView1.pauseAnimate()
    self.labelView2.pauseAnimate()
    self.labelView3.pauseAnimate()
    self.labelView4.pauseAnimate()
  }

}


