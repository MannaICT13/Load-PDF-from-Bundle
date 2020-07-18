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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load PDF", style: .plain, target: self, action: #selector(loadPDF))
        
        
    }
    
    @objc func loadPDF(){
        
        guard let url = Bundle.main.url(forResource: "thzz", withExtension: "pdf")else{return}

        let document = PDFDocument(url: url)
        let pdfView = PDFView(frame: view.frame)
        pdfView.document = document
        view.addSubview(pdfView)



        
    }
    
    
    


}

