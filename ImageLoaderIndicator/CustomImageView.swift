//
//  CustomImageView.swift
//  ImageLoaderIndicator
//
//  Created by Rounak Jain on 24/01/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit


class CustomImageView: UIImageView {
  
  let progressIndicatorView = CircularLoaderView(frame: CGRect.zero)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let url = URL(string: "http://images.apple.com/v/mac/shared/macos/a/images/macos/gallery_background_screen_medium_2x.png")
    //"https://upload.wikimedia.org/wikipedia/commons/f/ff/Pizigani_1367_Chart_10MB.jpg"

    addSubview(self.progressIndicatorView)
    progressIndicatorView.frame = bounds
    progressIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    sd_setImage(with: url, placeholderImage: nil, options: .cacheMemoryOnly, progress: {
      [weak self]
      (receivedSize, expectedSize) -> Void in
      self?.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
    }) {
        [weak self]
        (image, error, _, _) -> Void in
      self?.progressIndicatorView.reveal()
    }
  }
  
}
