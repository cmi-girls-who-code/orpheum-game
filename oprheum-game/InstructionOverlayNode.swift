//  InstructionOverlayNode.swift
//
//  Created by Clay Reimann
//

import SpriteKit

class InstructionOverlayNode: SKNode {
    let label1Height: CGFloat = 500
    let label2Height: CGFloat = 300
    let label3Height: CGFloat = 100
    let continueHeight: CGFloat = 50

    var size = CGSize.zero {
        didSet(oldSize) {
            background.path = backgroundPath()
            labelContinue.position = centeredPoint(at: continueHeight)
            label1.position = centeredPoint(at: label1Height)
            label2.position = centeredPoint(at: label2Height)
            label3.position = centeredPoint(at: label3Height)
        }
    }

    var text1 = "" {
        didSet(oldText) {
            label1.removeFromParent()
            label1 = makeLabel(text: text1)
            label1.position = centeredPoint(at: label1Height)
            self.addChild(label1)
        }
    }

    var text2 = "" {
        didSet(oldText) {
            label2.removeFromParent()
            label2 = makeLabel(text: text2)
            label2.position = centeredPoint(at: label2Height)
            self.addChild(label2)
        }
    }

    var text3 = "" {
        didSet(oldText) {
            label3.removeFromParent()
            label3 = makeLabel(text: text3)
            label3.position = centeredPoint(at: label3Height)
            self.addChild(label3)
        }
    }
    fileprivate var background: SKShapeNode!
    fileprivate var label1: SKLabelNode!
    fileprivate var label2: SKLabelNode!
    fileprivate var label3: SKLabelNode!
    fileprivate var labelContinue: SKLabelNode!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(scene: BaseScene) {
        self.init(size: scene.frame.size)
    }
    init(size: CGSize) {
        self.size = size
        super.init()

//        background = SKShapeNode(path: backgroundPath())
//        background.fillColor = SKColor.blackColor()
//        background.alpha = 0.25
//        self.addChild(background)

//        labelContinue = makeLabel(text: "Tap to continue")
//        labelContinue.fontSize = 25
//        labelContinue.position = centeredPoint(at: continueHeight)
//        self.addChild(labelContinue)

        label1 = makeLabel(text: "")
        self.addChild(label1)

        label2 = makeLabel(text: "")
        self.addChild(label2)

        label3 = makeLabel(text: "")
        self.addChild(label3)
    }

    func makeLabel(text: String) -> SKLabelNode {
        let lines = text.components(separatedBy: "\n")
        let node = SKLabelNode()
        for line in lines {
            let lbl = SKLabelNode(text: line)
            lbl.position = CGPoint(x: 0.0, y: -1.1 * node.fontSize * CGFloat(node.children.count))
            lbl.fontName = "Hoefler Text"
            node.addChild(lbl)
        }
        return node
    }
    func centeredPoint(at height: CGFloat) -> CGPoint {
        return CGPoint(x: size.width / 2, y: height)
    }

    func backgroundPath() -> CGPath {
        return CGPath(rect: CGRect(origin: CGPoint.zero, size: size), transform: nil)
    }
}
