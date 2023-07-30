# UIVisualEffectView creates a "hole punch" effect when the root view uses the system background color

When a UIVisualEffectView with a UIBlurEffect is a child of a view with a system background color, it creates a “hole punch effect” on visionOS where the user can see through the entire view hierarchy, including any views between the root view and the UIVisualEffectView.

The issue can be reproduced with the attached sample project. Notice that when the root view has its background color set to .systemBackground and both the photo and the UIVisualEffectView is shown, it creates a “hole punch” effect where the user can see through the entire window.

The attached video illustrates the issue using the sample project.