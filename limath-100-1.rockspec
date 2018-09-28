package = "limath"

version = "100-1"

source = {
	url = "http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/ar/limath-100.tar.gz",
	md5 = "9787b02273ed95865d6f59024faca999",
}

description = {
	summary = "An arbitrary precision integer library",
	detailed = "limath is an arbitrary precision integer library for Lua based on imath.",
	homepage = "http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/index.html#limath",
	license = "public domain/MIT + MIT",
}


dependencies = {
	"lua >= 5.1",
}

build = {
	type = "builtin",
	modules = {
	    imath = {
	        sources = {
	            "limath.c",
	            "src/imath.c"
	        },
	        incdirs = {
	            "src"
	        }
	    }
	}
}


