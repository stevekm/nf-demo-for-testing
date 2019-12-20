SHELL:=/bin/bash
export NXF_ANSI_LOG=false

# ~~~~~ Python and nextflow installation ~~~~~~ #
UNAME:=$(shell uname)
PATH:=$(CURDIR)/conda/bin:$(PATH)
unexport PYTHONPATH
unexport PYTHONHOME

ifeq ($(UNAME), Darwin)
CONDASH:=Miniconda3-4.7.12.1-MacOSX-x86_64.sh
endif

ifeq ($(UNAME), Linux)
CONDASH:=Miniconda3-4.7.12.1-Linux-x86_64.sh
endif

CONDAURL:=https://repo.continuum.io/miniconda/$(CONDASH)

conda:
	@echo ">>> Setting up conda..."
	@wget "$(CONDAURL)" && \
	bash "$(CONDASH)" -b -p conda && \
	rm -f "$(CONDASH)"

install: conda
	conda install -y \
	bioconda::nextflow=19.10.0

run:
	nextflow run main.nf -params-file params.json

clean:
	rm -f .nextflow.log*
	rm -f trace*.txt*
	rm -f *.html*
	rm -f flowchart*.dot
	rm -rf .nextflow
	rm -rf work
