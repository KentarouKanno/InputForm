//
//  StickerCell.swift
//  ProtocolOrientedMVVM
//
//  Created by kumapo on 2016/11/23.
//  Copyright © 2016年 kumapo. All rights reserved.
//

import UIKit
import SDWebImage

class StickerCell: UITableViewCell {
    
    var viewModel: StickerCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            fillImageView(with: viewModel)
            fillLabel(with: viewModel)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        reuseImageView()
    }
}

extension StickerCell: ImageViewContainer {
    typealias ImageContent = ImageURLPresentable
}
extension StickerCell: LabelContainer {
    typealias TextContent = TextPresentable
}
