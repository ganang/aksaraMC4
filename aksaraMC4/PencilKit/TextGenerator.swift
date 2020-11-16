//
//  TextGenerator.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 19/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import PencilKit

struct TextGenerator {

    // The number of strokes in each letter of the alphabet, for upper/lowercase assets.
    static let lowercaseStrokeCount = [1, 1, 1, 1, 1, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1]
    static let uppercaseStrokeCount = [3, 2, 1, 2, 4, 3, 2, 3, 3, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 2, 2, 1]
    
    static let templateColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    
    init() {
        // Get the lowercase and uppercase alphabet drawings.
    }
    
    static var pencilKitLigature: PKDrawing = {
        // Get the PencilKit ligature drawing.
        guard let ligatureData = NSDataAsset(name: "pencilkit")?.data, var drawing = try? PKDrawing(data: ligatureData) else {
            fatalError("Could not load PencilKit ligature drawing asset.")
        }
        drawing.strokes = drawing.strokes.map { stroke -> PKStroke in
            // Modify the strokes to have the correct color.
            var stroke = stroke
            stroke.ink = PKInk(.pen, color: TextGenerator.templateColor)
            return stroke
        }
        return drawing
    }()
    
    static var cobacoba: PKDrawing = {
        guard let ligatureData = NSDataAsset(name: "A")?.data, var drawing = try? PKDrawing(data: ligatureData) else {
            fatalError("Could not load PencilKit ligature drawing asset.")
        }
//
        drawing.strokes = drawing.strokes.map { stroke -> PKStroke in
            // Modify the strokes to have the correct color.
            var stroke = stroke
            stroke.ink = PKInk(.pen, color: TextGenerator.templateColor)
            return stroke
        }
        
        return drawing
    }()
    
    static var extreme: PKDrawing = {
        guard let ligatureData = NSDataAsset(name: "wa3")?.data, var drawing = try? PKDrawing(data: ligatureData) else {
            fatalError("Could not load PencilKit ligature drawing asset.")
        }
//
        drawing.strokes = drawing.strokes.map { stroke -> PKStroke in
            // Modify the strokes to have the correct color.
            var stroke = stroke
//            stroke.ink = PKInk(.pen, color: TextGenerator.templateColor)
            stroke.ink = PKInk(.pen, color: .clear)
            return stroke
        }
        
        return drawing
    }()
    
    
    
    func synthesizeTextDrawing(text: String) -> PKDrawing {
        // Special case the PencilKit ligature.
        if text.lowercased() == "pencilkit" {
            return TextGenerator.pencilKitLigature
        }
        if text == "coba" {
            return TextGenerator.cobacoba
        }
        
        return TextGenerator.extreme
        
    }
}

