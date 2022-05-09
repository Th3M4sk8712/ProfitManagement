//
//  ViewController.swift
//  ProfitManagement
//
//  Created by Ngoc IT. Nguyen Khanh on 23/04/2022.
//

import UIKit
import Charts

class DetailViewController: UIViewController {

    @IBOutlet var chartView: CombinedChartView!
    
    let months = ["1", "2", "3",
                  "4", "5", "6",
                  "7", "8", "9",
                  "10", "11", "12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        
        chartView.drawBarShadowEnabled = false
        chartView.highlightFullBarEnabled = false
        
        chartView.drawOrder = [DrawOrder.bar.rawValue,
                               DrawOrder.line.rawValue]
                
        chartView.setScaleEnabled(true)
        chartView.setScaleMinima(0.2, scaleY: 1)
        
        let l = chartView.legend
        l.wordWrapEnabled = true
        l.horizontalAlignment = .center
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.axisMinimum = 0
        xAxis.granularity = 1
        xAxis.valueFormatter = self
        xAxis.drawGridLinesEnabled = false
        xAxis.labelCount = months.count
        xAxis.centerAxisLabelsEnabled = true
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = false
        
        let leftAxis = chartView.leftAxis
        leftAxis.drawTopYLabelEntryEnabled = true
        leftAxis.spaceBottom = 0.2
        leftAxis.spaceTop = 0.2

        self.setChartData()
    }
    
    func setChartData() {
        let data = CombinedChartData()
        data.lineData = generateLineData()
        data.barData = generateBarData()
        
        chartView.xAxis.axisMaximum = data.xMax + 0.5
        
        chartView.data = data
    }
    
    func generateLineData() -> LineChartData {
        let color: UIColor = .systemGreen
        
        let entries = (0..<months.count).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i) + 0.5, y: Double(arc4random_uniform(15) + 5))
        }
        
        let set = LineChartDataSet(entries: entries, label: "Lợi nhuận")
        set.setColor(color)
        set.lineWidth = 2.5
        set.drawValuesEnabled = false
        set.drawCirclesEnabled = true
        set.drawCircleHoleEnabled = false
        set.circleRadius = 2
        set.fillColor = color
        set.mode = .cubicBezier
        
        return LineChartData(dataSet: set)
    }
    
    func generateBarData() -> BarChartData {
        let entries = (0..<months.count).map { i -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(i) + 0.5, yValues: [Double(arc4random_uniform(25) + 15), -Double(arc4random_uniform(13) + 12)])
        }
        
        let set = BarChartDataSet(entries: entries, label: nil)
        set.drawValuesEnabled = false
        set.stackLabels = ["Doanh thu", "Chi phí"]
        set.colors = [.systemBlue, .systemRed]
        
        let data = BarChartData(dataSet: set)
        data.barWidth = 0.6
                
        return data
    }
}

extension DetailViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "T\(Int(value + 1))"
    }
}
