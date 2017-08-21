//
//  CatSelectorView.swift
//  ARCat
//
//  Created by Mpalka on 18.08.2017.
//  Copyright © 2017 SoInteractive. All rights reserved.
//

import UIKit

enum CatTypes {
    case first
    case second
    case third
}

protocol CatSelectionProtocol: class {
    func catSelected(catType: CatTypes)
}

class CatSelectorView: UIView {
    
    private let nibName: String = "CatSelectorView"
    
    weak var catSelectionDelegate: CatSelectionProtocol?
    

    @IBAction func catOneTapped(_ sender: UIButton) {
        self.catSelectionDelegate?.catSelected(catType: .first)
    }
    
    @IBAction func catTwoTapped(_ sender: UIButton) {
         self.catSelectionDelegate?.catSelected(catType: .second)
    }
    
    @IBAction func catThreeTapped(_ sender: UIButton) {
         self.catSelectionDelegate?.catSelected(catType: .third)
    }
    
    override init(frame: CGRect) {
        // setup views frame
        let phoneFrame = UIScreen.main.bounds
        let viewHeight: CGFloat = UIScreen.main.bounds.height/4
        let viewFrame = CGRect(x: 0, y: phoneFrame.height - viewHeight, width: phoneFrame.width, height: viewHeight)
        super.init(frame: viewFrame)
        self.setupXib(withNibNamed: self.nibName)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupXib(withNibNamed: self.nibName)
        self.setupView()
    }
    
    private func setupView() {
        self.layer.cornerRadius = 13.0
        self.layer.backgroundColor = UIColor(red:1.00, green:0.78, blue:0.85, alpha:1.0).cgColor
        self.layer.masksToBounds = true
    }
    
    private func setupXib(withNibNamed nibName: String) {
        
        let mainView = loadViewFromNib(nibName: nibName)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainView)
        
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
}
