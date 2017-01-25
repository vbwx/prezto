#
# Provides Harp functions.
#
# Authors:
#   Bernhard Waldbrunner <vbwx01@gmail.com>
#

# Starts a Harp server instance with BrowserSync connected to it and opens the local site in a
# browser
function harp-serve {
	harp server &
	browser-sync start --proxy 'localhost:9000' --files \
		'public/**/*.jade, public/**/*.md, public/**/*.scss, public/**/*.coffee'
	open http://localhost:9000/
}
