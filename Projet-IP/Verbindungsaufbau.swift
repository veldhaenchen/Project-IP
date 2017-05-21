//
//  Verbindungsaufbau.swift
//  Projet-IP
//
//  Created by Johannes Velde on 16/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//

//
//--------
//Läuft Alles
//--------
//

import UIKit

class Verbindungsaufbau : ViewController{
    
    
    var i : Int = 0
    //Perfekte Ausnutzung des Bildschirmes = sehr geil
    var array : [String] = [
        
        "(N)-CONN_REQ \n\t-> (N+1) wartet sync\n",
        "(N-1)-CONN_REQ \n\t-> (N) wartet sync\n", "(N-1)-CONN_CONF \n\t-> Aufhebung des WZ von (N)\n",
        "Aufbereiten einer Verbanfrage PDU\n", "(N-1)-DATA_REQ \n\t-> ggf. mehrere IDUs am (N-1)-SAP \n\t-> (N) wartet async auf Bestätigung \n\t-> (N) wartet sync auf Antwort\n",
        "(N-1) bereitet DÜ vor \n\t-> (N-1)-DATA_CONF \n\t-> async Warten endet\n", "(N-1)-DATA_IND \n\t-> async Warten \n",
        "(N) übernimmt Informaton ggf. in mehreren IDUs\n", "(N-1)-DATA_RESP\n","(N) interpretiert Antwort-PDU \n\t-> Aufhebung des WZ\n",
        "(N)-CONNN_CONF \n\t-> sync Warten (N+1) endet \n\t->(N) geht in Zentralen WZ über"
        
    ]
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonpushed: UIButton!
    @IBAction func button(_ sender: Any) {
        if (i < array.count){
            label.text = label.text! + array[i]
            i = i + 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
