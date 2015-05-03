import UIKit

public let infoText = "The Réunion parrot or Dubois's parrot (Necropsittacus  "
                    + "borbonicus) is a hypothetical extinct species of parrot "
                    + "based on descriptions of birds from the Mascarene island "
                    + "of Réunion. Its existence has been inferred from the "
                    + "travel report of Dubois in 1674 who described it as "
                    + "having a “Body the size of a large pigeon, green; head, "
                    + "tail and upper part of wings the colour of fire.” No "
                    + "remains have been found of this supposed species, and "
                    + "its existence seems doubtful."


public let Bird1 = UIImage(named: "Bird1")!

public let Bird2 = UIImage(named: "Bird2")!

public let Bird3 = UIImage(named: "Bird3")!

public let Bird4 = UIImage(named: "Bird4")!

public let Bird5 = UIImage(named: "Bird5")!

public let Bird6 = UIImage(named: "Bird6")!

public class Avatar: UIImageView {
    public override func layoutSubviews() {
        super.layoutSubviews()

        layer.masksToBounds = true
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
}

public class Button: UIButton {
    public convenience init(label: String) {
        self.init()

        setTitle(label, forState: .Normal)
        layer.cornerRadius = 5
    }
}

public class Label: UILabel {
    public convenience init(text string: String, align: NSTextAlignment = .Center, fontSize: CGFloat = 20) {
        self.init()

        font = UIFont(name: "Avenir Next", size: fontSize)
        numberOfLines = 0
        text = string
        textAlignment = align
    }
}

public class Separator: UIView {
    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))

        backgroundColor = UIColor(white: 0.92, alpha: 1)
    }
}

public class Tag: UILabel {
    static let Padding = UIEdgeInsets(top: 3, left: 5, bottom: 2, right: 5)

    public convenience init(name: String) {
        self.init()

        font = UIFont(name: "Avenir Next", size: 16)
        layer.backgroundColor = UIColor(hue: 0.3, saturation: 0.5, brightness: 0.8, alpha: 1).CGColor
        layer.borderColor = UIColor(white: 0.92, alpha: 1).CGColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
        text = name
        textColor = UIColor.whiteColor()
    }

    public override func sizeThatFits(size: CGSize) -> CGSize {
        var result = super.sizeThatFits(size)

        result.width += Tag.Padding.left + Tag.Padding.right
        result.height += Tag.Padding.top + Tag.Padding.bottom

        return result
    }

    public override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, Tag.Padding))
    }
}

public extension UIView {
    public func renderAsImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, 0.0)

        layer.renderInContext(UIGraphicsGetCurrentContext())
        let result = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return result
    }
}
