Flipboard-like update checker
=============================

A Flipboard-like update checker.

1. Upload a file to a web server and set the value of REMOTE_VERSION_FILE<br/>
   File should contain just the version number, e.g. 1.2
2. Set the value of APP_NAME
3. Whenever you like to check for a new version just use this code.
   
	`SMUpdateNotifier *n = [[SMUpdateNotifier alloc] initWithDelegate:self];`<br/>
	`[n checkIfNewVersionExists];`

4. Your class should also implement the `SMUpdaterDelegate`, which has three delegate methods

	`-(void) newVersionExists:(NSString *)versionNumber`
	`-(void) thereIsNoNewVersion <br/>`
	`-(void) requestFailedwithError:(NSError *) error`

Names should be pretty explanatory :)