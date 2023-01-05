//
//  RecordViewController.swift
//  muscleRecord
//
//  Created by nakamori on 2023/01/05.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    private func setUpSegmentedControl() {
        guard let segmentedControl = segmentedControl else {
            return
        }

    }

}
