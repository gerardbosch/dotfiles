# cd + ls = cl
function cl() {
  DIR="$*";
  [ $# -lt 1 ] && DIR=$HOME    # if no DIR given, go home
  cd "${DIR}" && ls -A --color=auto
}

# PDF handling
pdf-merge() {
  gs -o out.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress $@
}

pdf2png() {
  for file in "$@"; do
    echo -e "\n>>> Converting file: ${file} ... <<<"
    gs -sDEVICE=pngalpha -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -r300 -o "${file%.[pP][dD][fF]}-%03d.png" "$file"
  done
}

pdf2jpg() {
  for file in "$@"; do
    echo -e "\n>>> Converting file: ${file} ... <<<"
    gs -sDEVICE=jpeg -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dJPGQ=100 -r300 -o "${file%.[pP][dD][fF]}-%03d.jpg" "$file"
  done
}
