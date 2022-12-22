

```sh

cd Kernfusion

# Create virtual environment:
python3 -m venv venv

# Activate the virual environment:
source venv/bin/activate

# Install MkDocs

pip install mkdocs-material
pip install mkdocs-roamlinks-plugin
pip install mkdocs-mermaid2-plugin
pip install mkdocs-callouts
pip install mkdocs-awesome-pages-plugin


# brew install mkdocs
# pip install -r requirements.txt
Python 3.10.9
```

## Resources

### python-xml-parser

- https://realpython.com/python-xml-parser/

... this article has lots of useful information on XML parsing in Python. I'm
giving the `xmlpulldom`, `untangle`, and maybe `xml2dict` or even `lxml` a try
here. But for the simple needs I have I assume that untangle does the job.

```sh
# https://untangle.readthedocs.io/en/latest/
cd Kernfusion
source venv/bin/activate
pip install untangle
```

### scrivener-python

- https://github.com/ajparsons/scrivener-python

... Python implementation to access Scrivener projects. At least five years
old. Did not look into it yet, but seems to be only in an early prototype
phase.

### scrivener-document-progress-in-python

- http://s.joebush3d.com/scrivener-document-progress-in-python/

... someone extracting the labels from a Scrivener document. I wanted to (maybe)
make use of them - maybe put them into the Markdown (as a YAML front matter
probably)

### scrivener_ecto

- https://github.com/drewolson/scrivener
- https://github.com/drewolson/scrivener_ecto

... not looked into it yet - no idea if we are even talking about the same
Scrivener here :-D

