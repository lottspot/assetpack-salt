PROJ := salt

$(PROJ).zip: data meta
	zip -r $@ $^

data:
	mkdir $@

meta:
	mkdir $@

clean:
	rm -f *.zip
