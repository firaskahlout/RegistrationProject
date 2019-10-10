







import UIKit

enum CellType{
    
    case input
    case dropdown
    case button
    case select
    
    
    var getClass: BaseCell.Type{
        switch self {
        case .input: return TextFieldCell.self
        case .dropdown: return TextFieldCell.self
        case .button: return DoneCell.self
        case .select: return GenderCell.self
        }
    }
}
