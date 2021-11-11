# CONFIG
# ダウンロードしたい画像に応じて、以下の設定部分を変更します。

# Version定数 - 駅メモサーバ側で定期的に変更があります(間違ってても弊害はなさそうです)
$version  = "20211111001";

# ラッピング - 色々あります
$wrapping = "ongeki";

# 画像の大きさ - large / small / medium(?)
$size     = "large";

# 画像の使用用途 - full : 立ち絵 / slot : タイムラインの右下の画像 / face : 顔アイコン / ???? : 車両基地 / ???? : 車両基地(編成中)
$type     = "full";

# 表情リスト
$emotions = @("smile", "dovey", "angry", "tired");


# Generate URL
function pic_url($version, $name, $wrapping, $size, $type, $emotion){
    return "https://static.native.denco.social.mfac.jp/v=${version}/img/partner/${name}/${wrapping}/${size}/${type}_${emotion}.png";
}

# main

# load ignore pattern
$ignore = Import-Csv .\ignore.pattern.txt
mkdir download

Get-Content .\wrapping.dict.txt | %{
    if( $_[0] -ne "#" -and $_ -ne ""){
        $wrapping = $_
        mkdir download/${wrapping}
        Get-Content .\dencoh.dict.txt | %{
            $dencoh = $_
            if( $_[0] -ne "#" -and $_ -ne "" -and ($ignore | ?{$_.dencoh_name -eq $dencoh -and $_.wrap_name -eq $wrapping}).Count -eq 0){
                $emotions | %{
                    $emotion = $_
                    try {
                        $URL = $(pic_url $version $dencoh $wrapping $size $type $emotion)
	                    Invoke-WebRequest $URL -O "download/${wrapping}/${dencoh}_${emotion}.png" &
                    }catch{
                        echo "ERR : ${dencoh} + ${wrapping}" >> ./error.log
                    }
                }
            }else{
                if ($_[0] -ne "#" -and $_ -ne ""){
                    echo "存在しない組み合わせ : ${dencoh} - ${wrapping}"
                }
            }
        }
    }
}