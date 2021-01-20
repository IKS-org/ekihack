from __future__ import unicode_literals
import json

out = []
jsons = ['stations1.json','stations2.json','stations3.json']

for js in jsons:
	file = open(js, 'r',encoding="utf-8")
	obj  = json.load(file)
	body = obj['contents']

	for station in body:
		out.append({\
              'id':station['station']['id'],\
              'element':station['station']['element'],\
              'name':station['station']['name'],\
              'kana':station['station']['kana'],\
              'delete_fg':station['station']['delete_fg']\
              })

out = json.dumps(out, sort_keys=True, ensure_ascii=False, indent=2)
with open('new_list.json', mode='w', encoding="utf-8") as f:
	f.write(out)