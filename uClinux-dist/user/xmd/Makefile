##########################

all:	mrd mwr

clean:
	@rm -f *.o mrd mwr

mrd:	mrd.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

mwr:	mwr.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

romfs:
	$(ROMFSINST) /bin/mrd
	$(ROMFSINST) /bin/mwr

