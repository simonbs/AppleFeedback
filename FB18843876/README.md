# App Intents cannot be created using a Swift macro — causes Xcode compilation failure

When a project includes an AppIntent generated via a Swift macro, Xcode fails to compile the project. The build produces the following output:

> 2025-07-14 21:51:38.087 appintentsmetadataprocessor[99594:22146569] Starting appintentsmetadataprocessor export
> 2025-07-14 21:51:38.225 appintentsmetadataprocessor[99594:22146569] error: At least one halting error produced during export. No AppIntents metadata have been exported and this target is not usable with AppIntents until errors are resolved.
> error: Static extraction builder failure: The file “@__swiftmacro_13PlaygroundKit7Example18AppIntentGeneratorfMe_.swift” couldn’t be opened because there is no such file.

Steps to reproduce:

The issue can be reproduced using the attached example project or by following the steps below.

1. Create an AppIntent using a Swift macro.
2. Build the project in Xcode.
3. Observe the compilation failure.

Expected Behavior:
Xcode should be able to compile projects that include AppIntents generated via Swift macros.

Actual Behavior:
Xcode fails to compile the project.
