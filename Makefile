NAME=ubuntu-stoq-default-settings

dist:
	mkdir -p dist/$(NAME)
	rsync -avz --exclude dist --exclude Makefile --exclude '.git*' . dist/$(NAME)

debsource: dist
	cd dist/$(NAME) && debuild --preserve-env -S
	@echo "To upload the sources to the ppa you can run:"
	@echo
	@echo "    dput <ppa_name> dist/*.changes"
	@echo

deb: dist
	cd dist/$(NAME) && debuild --preserve-env -us -uc
