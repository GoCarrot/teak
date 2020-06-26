# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = python2 -msphinx
SPHINXPROJ    = TeakUnity
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile update_docs_common

livehtml:
	sphinx-autobuild . _build/html

update_docs_common:
	cd teak-docs-common && git pull && cd .. && git add teak-docs-common && git commit -m "Update docs common." && git push
	cd ../teak-unity/docs/teak-docs-common && git pull && cd .. && git add teak-docs-common && git commit -m "Update docs common." && git push
	cd ../teak-air/docs/teak-docs-common && git pull && cd .. && git add teak-docs-common && git commit -m "Update docs common." && git push
	cd ../teak-server-api-docs/teak-docs-common && git pull && cd .. && git add teak-docs-common && git commit -m "Update docs common." && git push

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
