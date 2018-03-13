PROJ  := salt
BUILD := $(PROJ).zip

$(BUILD): data meta
	zip -r $@ $^

data:
	mkdir $@

meta:
	mkdir $@

clean:
	rm -f *.zip

install: $(BUILD)
	cp $(BUILD) $(HOME)/.mkproject/assets/$(BUILD)

.PHONY: clean install
