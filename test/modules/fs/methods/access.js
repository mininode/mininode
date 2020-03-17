const fs = require("fs");

fs.access("/tmp", fs.F_OK | fs.R_OK, function(err) {
	if (err) {
		console.log("failure");
	} else {
		console.log("success");
	}
});

fs.access("/etc/passwd", fs.F_OK | fs.W_OK, function(err) {
	if (err) {
		console.log("failure");
	} else {
		console.log("success");
	}
});

fs.access("/bin/ls", fs.X_OK, function(err) {
	if (err) {
		console.log("failure");
	} else {
		console.log("success");
	}
});
