# The Passwords preference pane cannot import passwords that contain a quotation mark

Attempting to import a CSV file with passwords that contain a quotation mark will cause the import to fail and the Passwords preference pane to import zero items.

Consider the following sample CSV file (also attached to the issue).

```csv
Title,Url,Username,Password
"Apple","https://apple.com","hello@example.com","super\"secret"
```

The file contains a single username and password for apple.com.

Username: hello@example.com

Password: super"secret

The password contains a quotation mark which has been escaped in the file because values are surrounded by quotation marks. I’ve also tried not escaping the quotation mark but unsurprisingly that also causes the import to fail.
