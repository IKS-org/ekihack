function getStart(){
	var e = document.getElementById('app');
	var w = document.getElementById('wrapping').value;
	var dencos = "nozomi,seria,mero,luna,miroku,reika,charlotte,sheena,saya,moe,iroha,siira,mobo,izuna,fubu,ringo,nyash,ichiho,imura,nikoro,sigure,ren,mirai,beatrice,urara,hokone,yachiyo,riona,chiko,reno,alice,kotan,eria,hiiru,iori,mio,mikoto,kuni,lulu,haru,nichina,sora,asa,saika,kanon,ataru,natsume,spica,mei,naho,himegi,noa,malin,nayori,himari,rara,mizuho,marika,momiji,shiori,chitose,mako,tsumugi,akehi,hibiki,minamo,maze,mitsuru,miyu,miyabi,ruri,nagisa,yamato,koyoi,nina,yunoka,reto,naru,shizu,nemo,you,yukari,kurogane,misora,meguru,minato,hime,tamaki,ginka,ai,yoshino,subaru,asahi,yuki,hina,aya,amane,mafuyu,otome".split(',');
	var HTML = "";

	dencos.forEach((element) => {
		HTML += '<div id="wrp_'+element+'" width=80px height=80px style="float : left;"><a target="_brank" href="https://static.game.our-rails.ekimemo.com/v=2020122301/img/partner/'+element+'/'+w+'/medium/full_usual.png"><img src="https://static.game.our-rails.ekimemo.com/v=2020122301/img/partner/'+element+'/default/small/face_smile.png"></a></div>';
	});
	e.innerHTML = HTML;
}

function loadJson(){
	var files = 
}