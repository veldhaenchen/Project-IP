//
//  Slash.swift
//  Projet-IP
//
//  Created by Johannes Velde on 14/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//

import Foundation

class Slash{
    
    //Eigentlich AnzahlNullen = 2^2 + 2^8
    func anzahlEinser(eingabe : Int) -> Int{
        let aE : Int = 32 - eingabe
        return aE
    }
    
    //Berechnet die Komplette Subnetzadresse (verwendete Methoden: anzahlEinser() & checksAus())
    func netMask(eingabe : Int) -> String {
        var aE : Int = anzahlEinser(eingabe : eingabe)
        var endergebnis : String! = nil
        var ausgabe : String = ""
        
        if (eingabe > 24) {
            aE = eingabe - 3*8
            endergebnis = checksAus(aE: aE)
            ausgabe = "255.255.255." + endergebnis
        } else if (eingabe > 16) {
            aE = eingabe - 2*8
            endergebnis = checksAus(aE: aE)
            ausgabe = "255.255." + endergebnis + ".0"
        } else if (eingabe > 8) {
            aE = eingabe - 8
            endergebnis = checksAus(aE: aE)
            ausgabe = "255." + endergebnis + ".0.0"
        } else {
            aE = eingabe
            endergebnis = checksAus(aE: aE)
            ausgabe = endergebnis + ".0.0.0"
        }
        return ausgabe
    }
    
    //Berechnet, was an der "wichtigen" Stelle im Subnetz stehen muss
    func checksAus(aE : Int) -> String{
        switch aE{
        case 1:
            return "128"
        case 2:
            return "192"
        case 3:
            return "224"
        case 4:
            return "240"
        case 5:
            return "248"
        case 6:
            return "252"
        case 7:
            return "254"
        case 8:
            return "255"
        default:
            return "0"
        }
        
    }
    
    //Rechnet reale Anzahl von Hosts aus (als Potenz)
    func möglHostsNormal(eingabe: Int) -> String {
        var aE : Int = anzahlEinser(eingabe: eingabe)
        var ausgabe  : String = ""
        if (aE >= 1 && aE <= 8) {
            ausgabe = "2^\(aE) - 2"
        } else if (aE >= 9 && aE <= 16) {
            aE = aE - 8
            ausgabe = "2^\(aE) * 2^8 - 2"
        } else if (aE >= 17 && aE <= 24) {
            aE = aE - 16
            ausgabe = "2^\(aE) * 2^8 * 2^8 - 2"
        } else if (aE >= 25 && aE <= 32) {
            aE = aE - 24
            ausgabe = "2^\(aE) * 2^8 * 2^8 * 2^8 - 2"
        }
        return ausgabe
    }
    
    //Rechnet reale Anzahl von Hosts aus (als Zahl)
    func möglHostsReal(eingabe: Int) -> Int {
        var aE = anzahlEinser(eingabe: eingabe)
        var ausgabe : Int = 0
        if (aE >= 1 && aE <= 8) {
            ausgabe = Int(pow(2.0, Double(aE)))
            ausgabe = ausgabe - 2
        } else if (aE >= 9 && aE <= 16) {
            aE = aE - 8;
            ausgabe = Int(pow(2.0, Double(aE)) * pow(2.0, 8.0))
            ausgabe = ausgabe - 2
        } else if (aE >= 17 && aE <= 24) {
            aE = aE - 16;
            ausgabe = Int(pow(2.0, Double(aE)) * pow(2.0, 8.0) * pow(2.0, 8.0) - 2.0)
        } else if (aE >= 25 && aE <= 32) {
            aE = aE - 24;
            ausgabe = Int(pow(2.0, Double(aE)) * pow(2.0, 8.0) * pow(2.0, 8.0) - 2.0)
        }
        return ausgabe
    }
    
    
    
    
    func SubnetzArea (count : Int, klasse : String, ae : Int, ipOne : Int, ipTwo : Int ,ipThree : Int, ipFour : Int) -> String{
        //rechnet Schrittgröße aus zb. 2^x
        var ergebnis : String = ""
        var subnetzStelle = 0
        var zuAenderneStelle : Int = 0
        //Schaut, welcher IpPart verändert werden muss
        switch count{
        case 1:
            zuAenderneStelle = ipOne
        case 2:
            zuAenderneStelle = ipTwo
        case 3:
            zuAenderneStelle = ipThree
        case 4:
            zuAenderneStelle = ipFour
        default:
            break
        }
        print("An der Stelle \(count) wird \(zuAenderneStelle) berechnet")
        //Läuft durch bis SubnetzStelle gefunden wurde. Die Stelle ist die nächst niedrigere 2^x Stelle von ipPart
        for _ in 0...zuAenderneStelle {
            if(subnetzStelle == zuAenderneStelle){
                break
            }
            else if (subnetzStelle < zuAenderneStelle){
                subnetzStelle = subnetzStelle + Int(pow(2.0, Double(ae)))
            }
        }
        if (subnetzStelle > zuAenderneStelle){
            subnetzStelle = subnetzStelle - Int(pow(2.0, Double(ae)))
        }
        
        //Zusammenführen als schöne Ausgabe
        switch count{
        case 1:
            ergebnis = "\(subnetzStelle).0.0.0" + "\n"
        case 2:
            ergebnis = "\(ipOne).\(subnetzStelle).0.0\n"
        case 3:
            ergebnis = "\(ipOne).\(ipTwo).\(subnetzStelle).0\n"
        case 4:
            ergebnis = "\(ipOne).\(ipTwo).\(ipThree).\(subnetzStelle)\n"
        default:
            break
        }
        return ergebnis
    }
    
    //Hier bin ich mir noch super unsicher, müsste aber mit switch ... aE-1 passen
    func bcAdresse (netzmaske : Int, count : Int, ipOne : Int, ipTwo : Int, ipThree : Int, ipFour : Int) -> String{
        var aE : Int = 32 - netzmaske
        
        //Rechnet aus, in welchen Schritten (Bsp. 3 dann 2^3=8) gerechnet werden muss
        if (aE >= 1 && aE <= 8) {}
        else if (aE >= 9 && aE <= 16) {aE = aE - 8}
        else if (aE >= 17 && aE <= 24) {aE = aE - 16}
        else if (aE >= 25 && aE <= 32) {aE = aE - 24}
        
        let one = ipOne % aE
        let two = ipTwo % aE
        let three = ipThree % aE
        let four = ipFour % aE
        
        print ("\(ipOne).\(ipTwo).\(ipThree).\(ipFour)")
        var result : String! = nil
        
        switch count{
        case 1:
            if(one==aE-1 && two==aE-1 && three==aE-1 && four==aE-1){result = "Ist BC-Adresse"}
            else if(one==0 && two==0 && three==0 && four==0) {result = "Ist Subnetzadresse"}
            else{result = "Ist reguläre Ip-Adresse"}
        case 2:
            if(two==aE-1 && three==aE-1 && four==aE-1){result = "Ist BC-Adresse"}
            else if(two==0 && three==0 && four==0) {result = "Ist Subnetzadresse"}
            else{result = "Ist reguläre Ip-Adresse"}
        case 3:
            if(three==aE-1 && four==aE-1){result = "Ist BC-Adresse"}
            else if(three==0 && four==0) {result = "Ist Subnetzadresse"}
            else{result = "Ist reguläre Ip-Adresse"}
        case 4:
            if(four==7){result = "Ist BC-Adresse"}
            else if(four==0) {result = "Ist Subnetzadresse"}
            else{result = "Ist reguläre Ip-Adresse"}
        default:
            break
        }
        
        return result
    }
    
    
}
