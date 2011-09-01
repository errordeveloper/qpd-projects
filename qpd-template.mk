%: %.mk
	$(MAKE) -f $@.mk
%.mk:
	qmake -o $@ qpd-template.pro TARGET=$(@:.mk=)

%.distclean: %.mk
	$(MAKE) -f $< distclean

%.clean: %.mk
	$(MAKE) -f $< clean

.PHONY: %.mk
