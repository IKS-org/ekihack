 #priestess_animal_2020,newyearparty_2020_2021,puyopuyo
 
 $wrap_name = Read-Host
 mkdir wrapping\$wrap_name
 $cnt = 0
 $category = "catalog"

type denco.txt | %{
 
 # $url = "https://static.game.our-rails.ekimemo.com/v=2020122301/img/partner/$_/default/small/face_smile.png"
 $url = "https://static.game.our-rails.ekimemo.com/v=2020122301/img/catalog/large/"+$_+"_occupied.png"
 
 #$url = "https://static.game.our-rails.ekimemo.com/v=2020122301/img/partner/$_/$wrap_name/large/slot_usual.png"
 echo $url

 bitsadmin /transfer "dencos" $url  "C:\Users\$env:USERNAME\Desktop\ekihack\$category\$wrap_name\$cnt`_$_.png"
 #if (!$?) {echo 0 > C:\Users\$env:USERNAME\Desktop\ekihack\wrapping\$wrap_name\$_`_is_not_ablable}

 $cnt += 1
 if ($_ -eq "nyash") {$cnt += 1}
}