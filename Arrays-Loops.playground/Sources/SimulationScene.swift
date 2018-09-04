//
//  GameOfLifeScene.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public func defaultPalette() -> [Character?] {
    return ["👾", "🐱", nil, nil, nil, nil, nil, nil]
}

public func paletteFilledWith(_ char: Character?, size: Int) -> [Character?] {
    return [Character?].init(repeating: char, count: size)
}

open class SimulationScene: SKScene {
    
    internal var sim: Simulation!
    internal var palette: [Character?]!
    
    var grid: TouchableGrid!
    var paletteGrid: PaletteGrid!
    open var playButton: MSPlayPauseToggleButtonNode!
    open var stepButton: MSButtonNode!
    var generationLabel: SKLabelNode!
    
    var timer: Timer? = nil
    
    var liveChar: Character?
    
    var generation = 1
    
    open func setup(simulation sim: Simulation, palette: [Character?]) {
        self.sim = sim
        sim.setup()
        self.palette = palette
    }
    
    open override func didMove(to view: SKView) {
        playButton = childNode(withName: "playButton") as! MSPlayPauseToggleButtonNode
        stepButton = childNode(withName: "stepButton") as! MSButtonNode
        playButton.selectedHandler = playPausePressed
        stepButton.selectedHandler = stepButtonPressed
        
        playButton.state = .hidden
        stepButton.state = .hidden
                
        generationLabel = childNode(withName: "generationLabel") as! SKLabelNode
        grid = childNode(withName: "grid") as! TouchableGrid
        grid.setup(sim.grid)
        grid.touchCallback = gridCellTouched
        
        paletteGrid = childNode(withName: "palette") as! PaletteGrid
        paletteGrid.setup(palette)
        paletteGrid.touchCallback = paletteCellTouched
        
        if palette.count != 0 {
            liveChar = palette[0]
            paletteGrid.highlightCell(0)
        } else {
            liveChar = "👾"
        }
    }
    
    func gridCellTouched(_ x: Int, y: Int) {
        if sim.grid[x][y] != liveChar {
            sim.grid[x][y] = liveChar
        } else {
            sim.grid[x][y] = nil
        }
        update()
    }
    
    func paletteCellTouched(_ x: Int, _: Int) {
        paletteGrid.highlightCell(x)
        liveChar = palette[x]
    }
    
    @objc func timerUpdate() {
        generation += 1
        generationLabel.text = "Generation: \(generation)"
        sim.update()
        update()
    }
    
    func playPausePressed() {
        if playButton.toggled {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SimulationScene.timerUpdate), userInfo: nil, repeats: true)
            timer?.fire()
        } else {
            timer?.invalidate()
        }
    }
    
    open func toggleButton() {
        playButton.mouseUp(with: NSEvent())
    }
    
    func stepButtonPressed() {
        timerUpdate()
    }
    
    func update() {
        grid.updateAll(sim.grid)
    }
}
