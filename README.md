Adding subprojects to this doc project:

* Install sphinx-doc if you have not already: http://www.sphinx-doc.org/en/master/usage/installation.html#macos
* Create a new Github Repo for the documentation if needed.
* Copy conf.py from this repo, removing references to intersphinx and changing project names as needed
* Copy requirements.txt from this repo.
* Create a new ReadTheDocs project for the sub-project: https://readthedocs.org/dashboard/
* Add that project to the `teak` project: https://readthedocs.org/dashboard/teak/subprojects/
* Add that project to the intersphinx_mapping in conf.py
* Add a link to the sidebar, contained in `index.rst` in this project

Getting started
* brew install python2
* pip2 install sphinx sphinx_rtd_theme breathe sphinx-autobuild
* make livehtml

If make livehtml fails, use make html
