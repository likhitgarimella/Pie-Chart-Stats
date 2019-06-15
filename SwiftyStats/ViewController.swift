//
//  ViewController.swift
//  SwiftyStats
//
//  Created by Brian Advent on 19.03.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import Charts   //Very important

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    
    //Data entry
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"  //Label as legend in the pie chart
        
        macDataEntry.value = macStepper.value
        macDataEntry.label = "macOS"    //Label as legend in the pie chart
        
        //To fill these data entries
        numberOfDownloadsDataEntries = [iosDataEntry, macDataEntry]
        
        updateChartData()
    }
 
    @IBAction func changeiOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updateChartData()
    }
    
    
    func updateChartData()
    {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "iosColor"), UIColor(named: "macColor")]
        
        //To assign these colors to charts
        chartDataSet.colors = colors as! [NSUIColor]
        
        //To assign data to the pie charts
        pieChart.data = chartData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

