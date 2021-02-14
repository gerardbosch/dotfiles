#
# Shell misc
#

# cl = cd + ls
cl() {
  DIR="$*";
  [ $# -lt 1 ] && DIR=$HOME    # if no DIR given, go home
  cd "${DIR}" && ls -A --color=auto
}

print-colors-shell() {
  for i in {0..255}; do
    print -Pn "%${i}F${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+"\n"}
  done
}

#
# PDF handling
#

pdf-merge() {
  gs -o out.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress $@
}

pdf2png() {
  for file in "$@"; do
    echo -e "\n>>> Converting file: ${file} ... <<<"
    gs -sDEVICE=pngalpha -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -r300 -o "${file%.[pP][dD][fF]}-%03d.png" "$file"
  done
}

## The following is already better covered by a ~/bin script
#pdf2jpg() {
#  for file in "$@"; do
#    echo -e "\n>>> Converting file: ${file} ... <<<"
#    gs -sDEVICE=jpeg -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dJPGQ=100 -r300 -o "${file%.[pP][dD][fF]}-%03d.jpg" "$file"
#  done
}

