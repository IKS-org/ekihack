import glob, codecs

files = glob.glob("./*.json")
for file in files:
	f = open(file, mode='r+')
	str = f.read()
	str = str.encode().decode("unicode-escape")

	n = open(file+"_decoded", mode='w');
	n.write(str);
