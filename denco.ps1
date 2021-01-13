$cnt = 0
$csv = ''

type denco.txt | %{
 $csv += [string]$cnt + ", " + $_ + "`n"
 $cnt += 1
 if ($_ -eq "nyash") {$cnt += 1}
}

echo $csv > denco.csv