//
//  ViewController.swift
//  Load PDF from Bundle
//
//  Created by Md Khaled Hasan Manna on 18/7/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    

    var pdfView : PDFView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load PDF", style: .plain, target: self, action: #selector(loadPDF))
        
        
    }
    
    @objc func loadPDF(){
        
        guard let url = Bundle.main.url(forResource: "thzz", withExtension: "pdf")else{return}

        let document = PDFDocument(url: url)
        pdfView = PDFView(frame: view.frame)
        pdfView.document = document
        addAnnotation()
        view.addSubview(pdfView)



        
    }
    
    func addAnnotation() {
        
     
        guard let selection = pdfView.currentSelection?.selectionsByLine()else{return}
        selection.forEach { (select) in
            select.pages.forEach { (page) in
                let annotaion = PDFAnnotation(bounds: select.bounds(for: page), forType: .highlight, withProperties: nil)
                
                annotaion.color = .yellow
                page.addAnnotation(annotaion)
            }
        }
        
        
        
    }
    
    
    


}

