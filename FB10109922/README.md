# Korean input doesn't work when calling -selectionWillChange() on the UITextInputDelegate in the setter of selectedTextRange

At this year’s WWDC I attended a ‘Developer Technical Support open hours’ lab regarding Korean text input in UITextInput. This was on Wednesday, June 8, 2022 at 9:30 a.m. PDT. The engineer and I went briefly through my code to identify what appears to be a bug in UITextInput, and I was asked to file this feedback along with a TSI.

It appears that UITextInput doesn’t properly handle Korean input when calling -selectionWillChange() in the setter of selectedTextRange (as recommended by the engineer during my lab session).

 The selectedTextRange implementation looks as follows:

var selectedTextRange: UITextRange? {
    get {
        if let range = selectedRange {
            return IndexedRange(range)
        } else {
            return nil
        }
    }
    set {
        let newRange = (newValue as? IndexedRange)?.range
        if newRange != _selectedRange {
            inputDelegate?.selectionWillChange(self)
            selectedRange = newRange
            inputDelegate?.selectionDidChange(self)
        }
    }
}

IndexedRange is my custom subclass of UITextRange. It holds an NSRange that’s assigned to selectedRange on my type conforming to UITextInput.

With this setup Korean input isn’t handled properly. Please see the attached video to understand the issue. The characters aren’t correctly ‘joined’.

After removing the call to selectionWillChange() Korean input will work fine. In that case the implementation looks as follows.

var selectedTextRange: UITextRange? {
    get {
        if let range = selectedRange {
            return IndexedRange(range)
        } else {
            return nil
        }
    }
    set {
        let newRange = (newValue as? IndexedRange)?.range
        if newRange != _selectedRange {
            selectedRange = newRange
            inputDelegate?.selectionDidChange(self)
        }
    }
} 

There’s another video attached that shows the correct behavior.