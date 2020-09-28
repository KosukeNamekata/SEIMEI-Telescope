for filename in `ls *.mag.1` ; do

awk 'BEGIN {nr = 1}
/^[^#]/ {
    s = $0
    gsub(/\\/,"",s)
    sub(/.FIT/,".FIT ",s)
    if (nr % 5 != 0) {
        printf("%s",s)
    }
    else {
        printf("%s\n",s)
    }
    nr++
}' <"$filename" | awk 'BEGIN{gyo = 1}
$28 !~ /INDEF/{
printf("%s %s %s %s %s\n",$29,$30,$31,$2,$3)
gyo++}
END{if (gyo==1)print}' | sort -n >"$filename.out"

done
