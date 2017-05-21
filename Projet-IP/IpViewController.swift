//
//  ViewController.swift
//  Projet-IP
//
//  Created by Johannes Velde on 14/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//

//Es ist 23:42 Uhr

import UIKit

class ViewController: UIViewController {
    //Interface
    @IBOutlet weak var firstThree: UITextField!
    @IBOutlet weak var secondThree: UITextField!
    @IBOutlet weak var thirdThree: UITextField!
    @IBOutlet weak var fourthThree: UITextField!
    @IBOutlet weak var netmask: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func generateOnce(_ sender: AnyObject) {
        firstThree.text = String(Int(arc4random_uniform(UInt32(256))))
        secondThree.text = String(Int(arc4random_uniform(UInt32(256))))
        thirdThree.text = String(Int(arc4random_uniform(UInt32(256))))
        fourthThree.text = String(Int(arc4random_uniform(UInt32(256))))
        netmask.text = String(Int(arc4random_uniform(UInt32(32) + 1)))
        while (netmask.text == "0"){
            netmask.text = String(Int(arc4random_uniform(UInt32(32) + 1)))
        }
    }
    
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        let ipOne : Int! = Int(firstThree.text!)!
        let ipTwo : Int! = Int(secondThree.text!)!
        let ipThree : Int! = Int(thirdThree.text!)!
        let ipFour : Int! = Int(fourthThree.text!)!
        let netzmaske : Int! = Int(netmask.text!)!
        
        //Oben mit Int!, damit ich in der if ipOne.. nehmen kann, sonst waäre dort firstthree.text
        if (ipOne == nil || ipTwo == nil || ipThree == nil || ipFour == nil || netzmaske == nil || netzmaske <= 0 || netzmaske >= 32){
            resultLabel.text = "Du musst was eingeben und > 0 & < 32 sein!"
        }else{
            //Anzahl einser, 32 - ae
            var ae : Int = Slash().anzahlEinser(eingabe: netzmaske)
            //Checkt die Klasse
            let Klasse  : String = EhemKlasse().ehemKlasse(ipOne: ipOne, ipTwo: ipTwo, ipThree : ipThree, ipFour : ipFour)
            
            //Checkt das Subnetz
            let ergebnis : String = Slash().netMask(eingabe : netzmaske)
            let möglHostsN : String = Slash().möglHostsNormal(eingabe: netzmaske)
            let möglHostsR : Int = Slash().möglHostsReal(eingabe: netzmaske)
            
            
            //zählt, in welchem IpPart gerechnet werden mus
            var count : Int = 4
            for i in (0...4).reversed(){
                if (ae<8){
                    count = i
                    break
                }else{
                    count = i
                    ae = ae - 8
                }
            }
            
            //Rechnet in welchem Subnetz es liegt
            let subnetzarea : String = Slash().SubnetzArea(count : count, klasse : Klasse, ae : ae, ipOne : ipOne, ipTwo : ipTwo ,ipThree : ipThree, ipFour : ipFour)
            
            //ckeckt, ob BC-Adresse, oder Subnetzadresse oder reg. IP
            let bc : String = Slash().bcAdresse(netzmaske : netzmaske, count : count, ipOne : ipOne, ipTwo : ipTwo, ipThree : ipThree, ipFour : ipFour)
            
            
            //Ausgabe
            let klasseAus : String = "Ehem. Klasse: \(Klasse)\n"
            let netmaskAus : String = "Netzmaske: \(ergebnis)\n"
            let hostsAus : String = "Anzahl mögl. Hosts: \n \(möglHostsN) = \(möglHostsR)\n"
            let subnetzAus : String = "Liegt im Subnetz: \(subnetzarea)"
            resultLabel.text = klasseAus + netmaskAus + hostsAus + subnetzAus + bc
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

