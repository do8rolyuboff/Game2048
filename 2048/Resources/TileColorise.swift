//
//  TileColorise.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 23.02.2021.
//

import UIKit

protocol TileColoriseProtocol: class {
    func tileColor(value: Int) -> UIColor
    func numberColor(value: Int) -> UIColor
}

class TileColorise: TileColoriseProtocol {
    func tileColor(value: Int) -> UIColor {
        switch value {
        case 2:
            return #colorLiteral(red: 0.9317575693, green: 0.8933070302, blue: 0.8544512391, alpha: 1)
        case 4:
            return #colorLiteral(red: 0.9338034987, green: 0.881600678, blue: 0.7901034951, alpha: 1)
        case 8:
            return #colorLiteral(red: 0.9549128413, green: 0.6975219846, blue: 0.47639817, alpha: 1)
        case 16:
            return #colorLiteral(red: 0.9642140269, green: 0.5883988738, blue: 0.3905704618, alpha: 1)
        case 32:
            return #colorLiteral(red: 0.9701781869, green: 0.4849210978, blue: 0.3741528988, alpha: 1)
        case 64:
            return #colorLiteral(red: 0.9696943164, green: 0.3741850853, blue: 0.2333484292, alpha: 1)
        case 128:
            return #colorLiteral(red: 0.9314228892, green: 0.8145456314, blue: 0.4504421949, alpha: 1)
        case 256:
            return #colorLiteral(red: 0.9314228892, green: 0.8145456314, blue: 0.4504421949, alpha: 1)
        case 512:
            return #colorLiteral(red: 0.9197638035, green: 0.7745715976, blue: 0.3070350289, alpha: 1)
        case 1024:
            return #colorLiteral(red: 0.9289024472, green: 0.7743801475, blue: 0.2455918789, alpha: 1)
        case 2048:
            return #colorLiteral(red: 0.9289024472, green: 0.7743801475, blue: 0.2455918789, alpha: 1)
        default:
            return #colorLiteral(red: 0.2414780855, green: 0.2272632122, blue: 0.2011188269, alpha: 1)
        }
    }
    
    func numberColor(value: Int) -> UIColor {
        if value <= 8 {
            return #colorLiteral(red: 0.4689514637, green: 0.4304460287, blue: 0.3959553838, alpha: 1)
        } else {
            return #colorLiteral(red: 0.9787672162, green: 0.9644836783, blue: 0.9471008182, alpha: 1)
        }
    }
}
