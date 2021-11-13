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
$emotions = @("usual") #, "smile", "dovey", "angry", "tired", "dreamy", "amaze");


# Generate URL
function pic_url($version, $name, $wrapping, $size, $type, $emotion){
    return "https://static.native.denco.social.mfac.jp/v=${version}/img/partner/${name}/${wrapping}/${size}/${type}_${emotion}.png";
}

# main

# load ignore pattern
$ignore = @{}
Import-Csv .\ignore.pattern.txt | %{$ignore[$_.dencoh_name] += @($_.wrap_name)}

if ( (test-path download) -ne $True ) {
    mkdir download
}

Get-Content .\wrapping.dict.txt | %{
    if( $_[0] -ne "#" -and $_.Trim() -ne ""){
        $wrapping = $_
        if ( (test-path download/${wrapping}) -ne $True ) {
            mkdir download/${wrapping}
        }
        Get-Content .\dencoh.dict.txt | %{
            $dencoh = $_
            if( $_[0] -ne "#" -and $_.Trim() -ne ""){

                if ($wrapping.length -lt 3){
                    echo $wrapping
                }

                $emotions | %{
                    $emotion = $_

                    $file_exist = (test-path "download/${wrapping}/${dencoh}_${emotion}.png")
                    # ファイルが存在する
                    if ( $file_exist ){
                        echo "既にファイルが存在します : ${dencoh} - ${wrapping}"
                        return
                    }

                    if ( $ignore.${dencoh}.Contains(${wrapping}) ){
                        echo "存在しない組み合わせ : ${dencoh} - ${wrapping}"
                        return
                    }

                    $URL = $(pic_url $version $dencoh $wrapping $size $type $emotion)
                    echo "START : ${URL}"
                    Start-Job -ScriptBlock {
                        try {
                            Invoke-WebRequest ${using:URL} -O "download/${using:wrapping}/${using:dencoh}_${using:emotion}.png"
                            #Invoke-WebRequest $URL -O "download/${wrapping}/${dencoh}_${emotion}.png"
                        }catch{
                            echo "ERR : ${using:dencoh} + ${using:type} + ${using:wrapping} + ${using:emotion}" >> ./error.log
                            #echo "ERR : ${dencoh} + ${type} + ${wrapping} + ${emotion}" >> ./error.log
                        }
                    }
                }
            }
        }
    }
}
