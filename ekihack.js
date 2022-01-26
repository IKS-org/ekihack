const get_csrfToken = ()=>{
    let csrf_token = "";
    document.cookie.split(';').forEach((v)=>{
        if (v.match(/csrf_token=/)){
            csrf_token = v.match(/csrf_token=/)['input'].split('=')[1];
        }
    });
    return csrf_token;
}

/*
 *   checkin
 *   チェックインします。
 *
 *   coord
 *   { lat : 緯度, lng : 軽度 }
 *
 *   dencoh
 *   アクセスするでんこ名
 *
 */
const checkin = (coord, dencoh)=>{
    const date = new Date();

    // 端末情報(なくてもよい)
    const os_id = "";

    // CSRFトークン 奪う
    const csrf_token = get_csrfToken();
    if (!csrf_token) {
        alart('アカウント情報が参照できませんでした。');
        return -1;
    }

    const uri = "https://game.our-rails.ekimemo.com/api/actions/access/checkin?__t="+date.getTime()+"&__os_id="+os_id+"&acc=&acquired=&kalman_distance=&kalman_lat=&kalman_lng=&lat="+coord.lat+"&lng="+coord.lng+"&mocked=&partner_name_en="+dencoh+"&speed=&time="+Math.floor( date.getTime() / 1000 );

    fetch(uri, { credentials:'include', method:'POST', headers:{'x-csrf-token':csrf_token, 'x-requested-with': 'XMLHttpRequest', 'Content-Type':'application/json'} }).then(res=>res.json()).then(res=>console.log(res));
};

const build_nozomiOnly_formation = ()=>{
    const date = new Date();
    const os_id = "";
    const csrf_token = get_csrfToken();

    const uri = "https://game.our-rails.ekimemo.com/api/my/slots/v2?__t="+date.getTime();

    // 編成情報
    const form = {
        "formation":[
            {
                "partner_name_en":"nozomi","dress":{"name_en":"default"}
            },
            {
                "partner_name_en":null,"dress":{"name_en":null}
            },
            {
                "partner_name_en":null,"dress":{"name_en":null}
            },
            {
                "partner_name_en":null,"dress":{"name_en":null}
            }
        ]
    };

    fetch(uri, { credentials:'include', method:'POST', headers:{'x-csrf-token':csrf_token, 'x-requested-with': 'XMLHttpRequest', 'Content-Type':'application/json'}, body:JSON.stringify(form) }).then(res=>res.json()).then(res=>console.log(res));
};


// 新宿駅にのぞみでチェックイン
const checkin_with_nozomi = ()=>{
    // JR新宿駅 座標
    const coord = {
        lat = 35.6909210,
        lng = 139.700258
    }
    // アクセスするでんこ
    const dencoh = "nozomi";
    checkin( coord, dencoh );
}

// 5分おきにチェックイン関数を呼び出し
const auto_checkin = ()=>{
    const intvId = window.setInterval(checkin_with_nozomi, 1000*60*5);
}
