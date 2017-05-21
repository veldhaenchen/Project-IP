//
//  BergriffeViewController.swift
//  Projet-IP
//
//  Created by Johannes Velde on 20/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//s

import UIKit

class BegriffeViewController: UIViewController {
    
    
    @IBOutlet weak var frage: UILabel!
    @IBOutlet weak var result: UILabel!
    //Angenehmes Rot
    let colorRed = UIColor(red:0.93, green:0.30, blue:0.18, alpha:1.0)
    //Angenehmes Grün
    let colorGreen = UIColor(red:0.11, green:0.73, blue:0.57, alpha:1.0)
    
    
    var fragen : [String] = [
        
        "Statischer Zeitmultiplex" ,
        "Hidden-Terminal-Problem",
        "Wellenlängenmultiplex" ,
        "Transitnetz",
        "Brute-Force-Angriff",
        "Vollständigkeitskontrolle",
        "Vertraulichkeit",
        "Verbindlichkeit",
        "Denial of Service",
        "Quellcodierung",
        "Kanalcodierung",
        "Dienstzugangspunkt (SAP)",
        "Wegewahl",
        "Transparenz",
        "Synchronisation",
        "Vollständigkeitskontrolle",
        "Sequenzkontrolle",
        "Staufenstermechanismus",
        "Instanz",
        "Schicht",
        "Logische Verbindung",
        "Lost Verfahren",
        "Reset Verfahren",
        "Reject Verfahren",
        "Schneller Schwund",
        "Langsamer Schwund",
        "Peer-to-Peer",
        "Vorwärtsfehlerkorrektur",
        ]
    
    var antwort : [String] = [
        
        "Für eine begrenzte Zeit wird die Leitung für einen Sender freigegeben",
        "Sender können keine Kollissionen bemerken\n\t->Nur beim Empfang können Kollisionen entdeckt werden \n\t->vgl. CSMA/CD" ,
        "Frequenzmultiplexen auf Lichtwellenleitern\n\t->Frequenzmultiplexen?",
        "Protokol wird von einem anderen komplett umschlossen \n\t->(IPv6)" ,
        "->Erschöpfende Suche \n\t->Zielt auf Vertraulichkeit & Integrität",
        "Die IP Instanz wartet bis Pakete da sind, ordnet diese und reicht sie an die nächst höhere Schicht weiter",
        "Unbefugte haben keine Kenntnis von Inhalten.",
        "Beweisbarkeit und Nichtabstreitbarkeit, dass Nachricht wirklich vom Absender stammt.",
        "Verlust der Verfügbarkeit. Durch Fluten eines Dienstes mit sinnlosen oder irregulären Inhalten (die etwa besonders hohen Rechenaufwand erzeugen) wird eine reguläre Nutzung dieses Dienstes verhindert.",
        
        "Bezeichnet die Übersetzung einer Nachricht in eine PDU",
        "Die zu übertragenden Bits werden in ein entsprechendes Signal transformiert.",
        "Schnittstelle zur (N)-Instanz. Am Dienstzugangspunkt(SAP) bietet eine Instanz den Zugriff auf ihre Dienstleistungen (bzw. das Ergebnis einer erbrachten Dienstleistung) an. Dieser Punkt stellt daher für Instanzen der höheren Schicht die Schnittstelle zu dieser Instanz dar.",
        "Beschreibt das Absenden eines Datums zu einem bestimmten Ziel durch Routing",
        "Daten der höheren Schichten ist für das Protokoll der eigenen Schicht “durchsichtig“",
        "Funktion der 2. Schicht, Erzeugung eines Signalvorlaufs (E ermittelt dadurch Kennzeitpunkte), Unterstützt die Takterkennung durch Schicht 1 Instanz, ist Zeichen- oder bitorientiert",
        "Instanz überwacht den korrekten Empfang aller PDUs und ist für Sicherung der Übertragung verantwortlich",
        "Instanz setzt zusätzlich richtige Reihenfolge beim Empfang voraus",
        "Ziel: Stau minimieren",
        "Aktives Element in einem OSI-System, das eine N-Schicht repräsentiert",
        "Ist formal die N-te Stufe der Architektur offener Kommunikationssysteme. Inhaltlich durch eine Menge von Funktionen und durch das Dienstangebot gegenüber höheren Schichten definiert",
        "Bezeichnet die Absprache zwischen gleichgestellten Instanzen über eine logische Kommunikation",
        "Nur fehlende Teile werden angefordert",
        "Alle Zähler auf 0 setzen - Fehleranzeige - Datenverlust möglich",
        "Neu Aufsetzen ab Übertragungsfehler - Verwerfen alle korrekten PDUs zw. Fehler und Wdh. - Einfach Implementierung -> Sendepuffer hat alle PDUs",
        "Ursache: Aufgrund einer Mehrwegausbreitung kann ein bewegter Empfänger 2 Signale empfangen, die sich destruktiv überlagern",
        "Abschottung verhindert den Empfang",
        "Transportschicht - Kontrolliert Korrektheit der DÜ zw. 2 Endsystemen - Schichten darunter nur log. Verb. Zu Schichten zum Nk",
        "Sender steckt zusätzliche Information in PDU, damit Empfänger die Möglichkeit hat, aufkommende Fehler zu entdecken",
        
        ]
    
    //bei snacktastic nachschauen, wie backgroundcolorcheck laeuft
    
    @IBOutlet weak var row: UIButton!
    
    @IBAction func checkColor(_ sender: UIButton) {
        //Es muss nur geschaut werden, ob Farbe rot oder grün ist
        if (row.backgroundColor == colorGreen){
            row.backgroundColor = colorRed
        }
        else{
            row.backgroundColor = colorGreen
        }
        
    }
    
    
    
    
    
    
    var fragentmp : [String] = []
    
    var i = 0
    var c = 0
    var bool : Bool = true
    //hier muss das rand raus!
    @IBAction func buttom(_ sender: UIButton) {
        if(c == fragen.count){
            c = 0
        }
        //Checken, ob nach der Reihe gegangen werden muss
        if (row.backgroundColor == colorGreen){
            if (bool){
                //Frage ausgeben
                frage.text = "Erkläre folgenden Begriff: \n \(fragen[c])"
                //Lösung schon reinschreiben, aber nicht sichtbar machen. Wenn das nicht wäre, würde immer eine andere Lösung kommen dank rand dem Hurensohn
                result.text = "\(antwort[c])"
                result.isHidden = true
                c = c + 1
                bool = false
            }else{
                result.isHidden = false
                bool = true
            }
        }else{
            
            //Größe von Fragenkatalog
            let count = fragen.count
            //Zufall wählen
            let rand = Int(arc4random_uniform(UInt32(count)))
            //Schauen, ob Antwort oder Frage ausgegeben weder muss
            
            if (bool){
                //Frage ausgeben
                frage.text = "Erkläre folgenden Begriff: \n \(fragen[rand])"
                //Lösung schon reinschreiben, aber nicht sichtbar machen. Wenn das nicht wäre, würde immer eine andere Lösung kommen dank rand dem Hurensohn
                result.text = "\(antwort[rand])"
                result.isHidden = true
                bool = false
            }else{
                result.isHidden = false
                bool = true
            }
            print(i)
            i += 1
        }
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        row.backgroundColor = colorGreen
        // frage.text = Int(arc4random_uniform(UInt32(round)))
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
