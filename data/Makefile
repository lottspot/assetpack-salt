
test: test/.vagrant
	cd test && vagrant rsync && vagrant provision

test/.vagrant:
	cd test && vagrant up --no-provision

clean:
	cd test && vagrant destroy -f && rm -rf test/.vagrant

.PHONY: clean test
