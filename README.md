# Tumblr-Detail


## Required Features Implementation Guide

### 1. Setup Navigation to Detail Screen

#### Steps:
1. **Open Main.storyboard**
2. Add a new View Controller:
   - Drag a "View Controller" from the Object Library
   - Place it to the right of your existing Table View Controller
3. Set the class:
   - Select the new View Controller
   - In Identity Inspector, set Class to `DetailViewController`
4. Create the segue:
   - Control-drag from the prototype cell in your Table View to the Detail View Controller
   - Select "Show" (for push navigation)
5. Set the segue identifier:
   - Click the segue arrow
   - In Attributes Inspector, set Identifier to `showDetail`

### 2. Create Detail View UI

#### Add these elements:
1. **UIImageView** (for the post image):
   - Set constraints: top 20, leading/trailing 0, aspect ratio 1:1
   - Content Mode: Aspect Fill
   - Clips to Bounds: true

2. **UITextView** (for the caption):
   - Set constraints: top to image bottom +20, leading/trailing 16, bottom 20
   - Properties:
     - Editable: false
     - Selectable: true
     - Font: System 17pt
     - Text Color: Dark Gray

3. Connect outlets in `DetailViewController.swift`:
```swift
@IBOutlet weak var photoImageView: UIImageView!
@IBOutlet weak var captionTextView: UITextView!
