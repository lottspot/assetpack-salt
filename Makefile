PROJ  := salt
BUILD := $(PROJ).zip
DATA  := $(shell find data -type f 2>/dev/null)
META  := $(addsuffix .json,$(patsubst data/%,meta/%,$(DATA)))

$(BUILD): data meta
	zip -r $@ $^

data: $(DATA)

meta: $(META)

%.json:
	mkdir -p $(dir $@) 2>/dev/null || true
	echo '{}' > $@

clean:
	rm -f *.zip

install: $(BUILD)
	cp $(BUILD) $(HOME)/.mkproject/assets/$(BUILD)

dirs:
	mkdir data meta

.PHONY: clean install dirs
