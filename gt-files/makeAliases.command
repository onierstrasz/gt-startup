#! /bin/sh
#
# Create aliases and start commands for images with given repos loaded
#
# put this in a newly created GT folder and run it
#
# 2023-01-10

D=`dirname "$0"`
cd "$D"

# --------------------------------------------------------------------------------
makeStartCmd () {
	C="_start-$1.command"
	if test -e "$1.image"
	then
		if test ! -e "$C"
		then
			cat > "$C" <<eof
#! /bin/sh
cd `dirname "$0"`
ulimit -n 10240
./GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit --image $1.image
eof
			echo "Created $C"
			chmod 0755 "$C"
		fi
	fi
}
# --------------------------------------------------------------------------------
link () {
	R="${D}/pharo-local/iceberg/$1/$2"
	if test -d "$R"
	then
		if test ! -e "_$2"
		then
			ln -s "$R" "_$2"
			echo "Linked _$2"
			makeStartCmd "$2"
		fi
	fi
}
# --------------------------------------------------------------------------------

makeStartCmd gtbook

link onierstrasz gt-startup

link feenkcom gtoolkit-shorts
link feenkcom gt4sudoku
link feenkcom yaml-parser
link feenkcom gtoolkit-demos

link pavt workflow-evolution
link pavt egad

link onierstrasz GtKatas
link onierstrasz gt-demos
link onierstrasz gt-talks
link onierstrasz zest-demo
link onierstrasz HomeAdmin
link onierstrasz esugWebsite

link scgbern scgpico

link bergel GeneticallyCreatedTests

exit
# --------------------------------------------------------------------------------

