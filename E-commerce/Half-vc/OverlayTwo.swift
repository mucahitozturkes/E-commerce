//
//  OverlayView.swift
//  half-vc
//
//  Created by mücahit öztürk on 7.02.2024.
//

import UIKit

class OverlayViewTwo: UIViewController {
    
    @IBOutlet weak var XLB: UIButton!
    @IBOutlet weak var LB: UIButton!
    @IBOutlet weak var MB: UIButton!
    @IBOutlet weak var SB: UIButton!
    @IBOutlet weak var XSB: UIButton!
    @IBOutlet weak var topView: UIView!
    
    var selectedButton: UIButton?
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    var helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        helper.configureView(topView, CRadius: 3)
        
        // Butonlara tıklama olaylarını ekleyin
        XLB.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        LB.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        MB.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        SB.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        XSB.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        guard translation.y >= 0 else { return }
        
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Seçili butonun etrafına kırmızı renkte bir stroke ekleyin
        addStrokeToButton(sender)
        
        // Önceki seçili butonun stroke'unu kaldırın
        if let previousButton = selectedButton {
            removeStrokeFromButton(previousButton)
        }
        
        // Seçilen butonu güncelle
        selectedButton = sender
    }
    
    private func addStrokeToButton(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 6
    }
    
    private func removeStrokeFromButton(_ button: UIButton) {
        button.layer.borderWidth = 0
        button.layer.borderColor = nil
    }
}

