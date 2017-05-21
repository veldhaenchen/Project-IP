//
//  EhemKlasse.swift
//  Projet-IP
//
//  Created by Johannes Velde on 14/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//

import Foundation

class EhemKlasse : ViewController{
    
    //Checkt die ipOne, um Klasse zu ermitteln und gibt sie als Klasee | ip.ip.ip.ip aus
    func ehemKlasse (ipOne: Int,ipTwo : Int, ipThree : Int, ipFour : Int) -> String{
        if (ipOne >= 0 && ipOne < 128){return "A | \(ipOne).0.0.0"}
        else if (ipOne >= 128 && ipOne < 192){return "B | \(ipOne).\(ipTwo).0.0"}
        else if (ipOne >= 192 && ipOne < 224){return "C | \(ipOne).\(ipTwo).\(ipThree).0"}
        else if (ipOne >= 224 && ipOne < 239){return "D | \(ipOne).\(ipTwo).\(ipThree).\(ipFour)"}
            //Else, das sonst bei else if (ipOne >= 240 && ipOne < 255)..noch ein extra return raus muss
        else{return "E | \(ipOne).\(ipTwo).\(ipThree).\(ipFour)"}
    }
}
