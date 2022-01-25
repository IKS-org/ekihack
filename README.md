# ekihack

## download.ps1
駅メモの既知のでんこ・ラッピングを全てダウンロードするスクリプトです。  

## 動作要件
- PowerShell v6.0 以上
    > - Windows PowerShellを利用している場合は、Windows UpdateからOSを最新の状態に更新し、Windows PowerShell 上で `winget install pwsh` と実行するとPowerShellをインストールできます。  
    > - Windows PowerShell と PowerShell は別物です。  

- 実行ポリシーでスクリプトの実行がブロックされないこと
    > - PowerShell には**実行ポリシー**という概念があり、不正なコードを含むスクリプトの実行を防止するため、PowerShellスクリプトの実行を拒否することでコンピュータのセキュリティを高めています。`download.ps1`はPowerShellで記述されたスクリプトですので、ポリシーによって実行が拒否される場合があります。

## How to use
PowerShellで以下のように実行します。
```
iwr https://raw.githubusercontent.com/sweshelo/ekihack/master/download.ps1 | iex
```

## 免責事項
このスクリプトを用いることで一部非公開データにアクセスできる可能性があります。  
なお、ダウンロードされるファイルはサーバ上に配置されアクセス制限が掛けられていない状態のため、利用規約や法令等に違反する動作は行っておりません。
