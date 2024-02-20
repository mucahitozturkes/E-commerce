//
//  FiltersViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 19.02.2024.
//

import UIKit
import WARangeSlider

class FiltersViewController: UIViewController {
    @IBOutlet weak var discardView: UIView!
    @IBOutlet weak var applyButton: UIButton!
    //Category
    @IBOutlet weak var girlsLabel: UILabel!
    @IBOutlet weak var boysLabel: UILabel!
    @IBOutlet weak var menLabel: UILabel!
    @IBOutlet weak var womenLabel: UILabel!
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var girlsView: UIView!
    @IBOutlet weak var boysView: UIView!
    @IBOutlet weak var menView: UIView!
    @IBOutlet weak var womenView: UIView!
    @IBOutlet weak var allView: UIView!
    //Sizes
    @IBOutlet weak var xlLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var xsLabel: UILabel!
    @IBOutlet weak var sizes5: UIView!
    @IBOutlet weak var sizes4: UIView!
    @IBOutlet weak var sizes3: UIView!
    @IBOutlet weak var sizes2: UIView!
    @IBOutlet weak var sizes1: UIView!
    
    @IBOutlet weak var secondPrice: UILabel!
    @IBOutlet weak var firstPrice: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var priceView: UIView!
    var helper = Helper()
    let rangeSlider1 = RangeSlider(frame: CGRect.zero)
    
    // Array to keep track of selected state for each cell
    var selectedStates: [Bool] = []
   
    var isButtonStyle = false
    
    var selectedStates2: [Bool] = []
   
    var isButtonStyle2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.configureButton(applyButton)
        helper.configureView(discardView, CRadius: 15)
        rangeSlider1.thumbTintColor = UIColor(named: "button")!
        rangeSlider1.trackHighlightTintColor = UIColor(named: "button")!
        rangeSlider1.lowerValue = 0
        rangeSlider1.upperValue = 5000
        priceView.addSubview(rangeSlider1)
        
        rangeSlider1.addTarget(self, action: #selector(FiltersViewController.rangeSliderValueChanged(_:)), for: .valueChanged)
        
        // Initialize selected states for each cell
        selectedStates = Array(repeating: false, count: 20)
        
        helper.configureView(sizes1, CRadius: 5)
        helper.configureView(sizes2, CRadius: 5)
        helper.configureView(sizes3, CRadius: 5)
        helper.configureView(sizes4, CRadius: 5)
        helper.configureView(sizes5, CRadius: 5)
        
        helper.configureView(allView, CRadius: 5)
        helper.configureView(womenView, CRadius: 5)
        helper.configureView(menView,CRadius: 5)
        helper.configureView(boysView, CRadius: 5)
        helper.configureView(girlsView, CRadius: 5)
        
        
        // Default renkleri ayarla
        setDefaultColors()
        setDefaultColors2()

        // Her bir eleman için tıklama olayını ekle
        addTapGesture(to: sizes1, label: xsLabel)
        addTapGesture(to: sizes2, label: sLabel)
        addTapGesture(to: sizes3, label: mLabel)
        addTapGesture(to: sizes4, label: lLabel)
        addTapGesture(to: sizes5, label: xlLabel)
        
        addTapGesture2(to: allView, label: allLabel)
        addTapGesture2(to: womenView, label: womenLabel)
        addTapGesture2(to: menView, label: menLabel)
        addTapGesture2(to: boysView, label: boysLabel)
        addTapGesture2(to: girlsView, label: girlsLabel)
      }

    func setDefaultColors() {
        let defaultLabelColor = UIColor.black
        let defaultViewColor = UIColor.white

        xlLabel.textColor = defaultLabelColor
        lLabel.textColor = defaultLabelColor
        mLabel.textColor = defaultLabelColor
        sLabel.textColor = defaultLabelColor
        xsLabel.textColor = defaultLabelColor

        sizes5.backgroundColor = defaultViewColor
        sizes4.backgroundColor = defaultViewColor
        sizes3.backgroundColor = defaultViewColor
        sizes2.backgroundColor = defaultViewColor
        sizes1.backgroundColor = defaultViewColor
    }
    func setDefaultColors2() {
        let defaultLabelColor = UIColor.black
        let defaultViewColor = UIColor.white

        girlsLabel.textColor = defaultLabelColor
        boysLabel.textColor = defaultLabelColor
        menLabel.textColor = defaultLabelColor
        womenLabel.textColor = defaultLabelColor
        allLabel.textColor = defaultLabelColor

        girlsView.backgroundColor = defaultViewColor
        boysView.backgroundColor = defaultViewColor
        menView.backgroundColor = defaultViewColor
        womenView.backgroundColor = defaultViewColor
        allView.backgroundColor = defaultViewColor
    }

    func addTapGesture(to view: UIView, label: UILabel) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }
    func addTapGesture2(to view: UIView, label: UILabel) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped2))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }

        // Default renklere dön
        setDefaultColors()

        // Tıklanan elemanın rengini değiştir
        tappedView.backgroundColor = UIColor.button
        // Eğer ilgili eleman bir UILabel ise, onun rengini değiştir
        if let label = tappedView.subviews.compactMap({ $0 as? UILabel }).first {
            label.textColor = UIColor.white
        }

        // Durumu tersine çevir
        isButtonStyle.toggle()
    }
    
    @objc func viewTapped2(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }

        // Default renklere dön
        setDefaultColors2()

        // Tıklanan elemanın rengini değiştir
        tappedView.backgroundColor = UIColor.button
        // Eğer ilgili eleman bir UILabel ise, onun rengini değiştir
        if let label = tappedView.subviews.compactMap({ $0 as? UILabel }).first {
            label.textColor = UIColor.white
        }

        // Durumu tersine çevir
        isButtonStyle2.toggle()
    }
    
    override func viewDidLayoutSubviews() {
        let width = priceView.bounds.width - 24
        rangeSlider1.frame = CGRect(x: 16, y: 50, width: width, height: 32.0)
    }
    
    @objc func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        let formattedLowerValue = String(format: "$%.0f", rangeSlider.lowerValue * 5000)
        let formattedUpperValue = String(format: "$%.0f", rangeSlider.upperValue * 5000)
        
        firstPrice.text = formattedLowerValue
        secondPrice.text = formattedUpperValue
        
        print("Range slider value changed: (\(formattedLowerValue) , \(formattedUpperValue))")
    }
    
    
    @IBAction func applyButtonPressed(_ sender: UIButton) {
        if let navigationController = navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
        }
    }

    
}

extension FiltersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCell", for: indexPath) as? ColorsCell
        
        // Configure the cell based on selected state
        cell?.updateSelectionState(selectedStates[indexPath.item])
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Toggle the selected state for the tapped cell
        selectedStates[indexPath.item] = !selectedStates[indexPath.item]
        
        // Update the cell's appearance based on the selected state
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorsCell {
            cell.updateSelectionState(selectedStates[indexPath.item])
        }
    }
}

class ColorsCell: UICollectionViewCell {
    
    @IBOutlet weak var borders: UIView!
    @IBOutlet weak var colorView: UIView!
    var helper: Helper! // Assuming Helper is a class or struct you've defined
    
    override func awakeFromNib() {
        super.awakeFromNib()
        helper = Helper()
        helper.configureView(colorView, CRadius: 17)
        helper.configureView(borders, CRadius: 20)
        // Set a random background color
        colorView.backgroundColor = getRandomColor()
        
        borders.layer.borderColor = UIColor.red.cgColor
    }
    
    func updateSelectionState(_ isSelected: Bool) {
        borders.layer.borderWidth = isSelected ? 1 : 0
    }

    func getRandomColor() -> UIColor {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
