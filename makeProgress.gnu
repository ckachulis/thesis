set ylabel "pages"
set y2label "filesize (Mbytes)"
set y2tics
set ytics nomirror
set xdata time
set timefmt "%s"
set format x "%Y/%m"
#set xrange["2017/09":"2018/05"]
set xrange["1504224000":"1525132800"]
set yrange[0:200]
set y2range[0:]


plot "progress.dat" using 1:2 with lines axis x1y1 title "Page count"
replot "progress.dat" using 1:($3/(1048576)) with lines axis x1y2 title "File size"

#set term pdf size 10,6 fsize 16 lw 8
set term pdf
set output 'progress.pdf'
replot

set term x11

set yrange[0:]
set y2range[0:50000]
set y2label "words"

plot "progress.dat" using 1:2 with lines axis x1y1 title "Page count"
replot "progress.dat" using 1:4 with lines axis x1y2 title "Word count"

#set term pdf size 10,6 fsize 16 lw 8
set term pdf
set output 'progress_w.pdf'
replot

set term x11

set yrange[0:]
set y2range[0:275000]
set y2label "characters"
plot "progress.dat" using 1:2 with lines axis x1y1 title "Page count"
replot "progress.dat" using 1:5 with lines axis x1y2 title "character count"

#set term pdf size 10,6 fsize 16 lw 8
set term pdf
set output 'progress_c.pdf'
replot