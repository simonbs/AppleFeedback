# Intent doesn't have permission to write to files passed as input

When attempting to write to a file passed as input to a shortcut action, the write operation fails with an error saying that the intent does not have permission to write to the file (error code 513, NSFileWriteNoPermissionError)

The error occurs even if I call -
startAccessingSecurityScopedResource() on the file URL.

The issue is shown in the example project.