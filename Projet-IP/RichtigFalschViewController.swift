//
//  RichtigFalschViewController.swift
//  Projet-IP
//
//  Created by Johannes Velde on 21/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//

import UIKit

class RichtigFalschViewController: UIViewController {
    
    
    let questions = [
        FragenKatalog(question: "Zeitmultiplexverfahren sind nur digital möglich", answer: false, explanation: "Falsch. Beispiel: Analoges Telefon oder Sprechanalage"),
        
        FragenKatalog(question:  "Bei der Nutzung von CONS kann in der Transportschicht teilweise auf Maßnahmen zur Behandlung von Übertragungsfehler verzichtet werden", answer: true, explanation:
            "Richtig, da schon in den unteren Schichten die Fehler behandelt werden"),
        
        FragenKatalog(question: "Multiplexen ist eine Dienstleistung im OSI- Ref Modell", answer: false, explanation:       "Falsch, Multiplexen ist eine Funktion und nur schichtintern nutzbar und somit keine Dienstleistung")
    ]
    
    let frage : [String] = [
        
        "In jeder Schicht des ISO OSI Referenzmodelles is genau eine Funktion angesiedelt",
        "Jede Dienstleistung, die eine Instanz der Schicht N den Instanzen der übergeordneten Schicht anbietet, wird nur durch (N) Funktionen erbracht",
        "Der Einsatz selbsttaktender Signale führt bei gleicher Bandbreite zu einer höheren Übertragungsgeschwindigkeit im Vergleich zu nicht-selbsttaktenden Signalen",
        "Das Frequenzmultiplexverfahren ist nur auf metallischen Übertragungswegen realisierbar",
        "Das Internet Protokol benutzt regionalisierte Adressen",
        "Am (3) SAP ist oberhalb eines CLNS eine Sequenzkontrolle sinnlos",
        
        
        ]
    
    let antwort : [String] = [
        
        "Falsch! Aufgrund der hierarchischen Architektur wird eine Schicht inhaltlich durch eine MENGE von Funktionen und durch das Dienstleistungsangebot dieser Schicht gegenüber höheren Schicht definiert",
        "Falsch! Jede Instanz kann sich auch auf die Dienstleistungen der darunterliegenden Schicht abstützen",
        "Falsch! Es ist gerade anders herum - die Übertragungsgeschwindigkeit halbiert sich",
        "Falsch! Es funktioniert auch mit z.b Lichtwellenleitern, ein anderes Beispiel wäre der Funkverkehr. Prinzipiell mit jeder Übertragung die auf Wellen basiert",
        "Falsch! Die IPs sind auf eine Organisation bezogen und nicht auf eine Region",
        "Richtig! Beim Verbindungslosen Protokoll liegt darunter auch keine Kontrolle vor",
        
        
        ]
    
    
    @IBOutlet weak var Antwort: UILabel!
    @IBOutlet weak var Frage: UILabel!
    
    
    
    @IBAction func next(_ sender: UIButton) {
        
        
        //Zufallszahl generieren
        
        
    }
    
    
    
    
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        
        // Exits if there aren't any questions left
        if currentQuestionIndex >= questions.count { return }
        
        // Retrieves the user's answer and figures out if it correct
        let userAnswer = sender.currentTitle
        //  let isAnswerCorrect = userAnswer?.toBool() == questions[currentQuestionIndex].answer
        
        // Prints appropiate message
        //   Antwort.text = (isAnswerCorrect) ? "Correct" : "Incorrect"
        
        // Updates with a new question
        currentQuestionIndex = currentQuestionIndex + 1
        let isThereAnyQuestionsLeft = currentQuestionIndex < questions.count
        Frage.text = (isThereAnyQuestionsLeft) ? questions[currentQuestionIndex].question : "No more questions"
        
        
        
        let rand = Int(arc4random_uniform(UInt32(frage.count)))
        let question : String = frage[rand]
        let answer : String = antwort[rand]
        Frage.text = question
        let check : Character = answer.characters.first!
        print("Antwort war \(check)" )
        
        let propertyToCheck = sender.currentTitle!
        
        switch propertyToCheck {
        case  "Richtig":
            if (check == "F"){
                print("Falschen Button gedrückt")
            }else{
                print("Richtigen Button gedrückt")
                Antwort.text = antwort[rand]
            }
            
            
        // do something
        case "Falsch":
            if (check == "R"){
                print("Falschen Button gedrückt")
            }else{
                print("Richtigen Button gedrückt")
                Antwort.text = antwort[rand]
            }
            
        // do something else
        default: break
        }
    }
    
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Antwort.text = ""
        self.Frage.text = questions[currentQuestionIndex].question
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
