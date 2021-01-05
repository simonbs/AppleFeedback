# Deleting characters in UITextView is slow when it contains a big string

Deleting characters in a plain instance of UITextView, e.g. no custom text storage, layout manager, text container etc., is slow when the UITextView contains a big string. I have tested this by loading a roughly 4MB plain text string into the text view. The problem is shown in the attached video. Notice that the delete button remains highlighted while the main thread is hanging. 

I have attached a recording using the Time Profiler instrument. There's also a screenshot of the recording. It looks like the problem occurs when UITextView's tokenizer (which appears to be implemented by the private UITextInputControllerTokenizer) attempts to find the enclosing range of a position, possibly a line.

It would be great if UITextInputControllerTokenizer was public, so developers could override -rangeEnclosingPosition:withGranularity:inDirection: and provide their own implementation without needing to implement all of UITextInputControllerTokenizer's logic. Developers may already be keeping track of lines, paragraphs etc. for other purposes, e.g. line numbering.
