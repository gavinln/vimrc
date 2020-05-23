# Example Makefile

# Makefile 5 steps
# https://the-turing-way.netlify.app/make/make.html#learn-make-by-example
# 1. Basics
# 2. all, clean and help targets
# 3. Phony targets
# 4. Automatic variables and pattern rules
# 5. Wildcards and path substitution
# 6. Debugging make files

# Path utilities
# basename - strip directory and suffix from filenames
# dirname - strip last component from file name
# realpath - print the resolved path
# readlink - print resolved symbolic links or canonical file names

SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

ALL_CSV = $(wildcard data/*.csv)
INPUT_CSV = $(wildcard data/input_file_*.csv)
DATA = $(filter-out $(INPUT_CSV),$(ALL_CSV))
FIGURES = $(patsubst data/input_file_%.csv,output/figure_%.png,$(INPUT_CSV))

.PHONY: all clean help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: output/report.html  ## build all targets

# Example for 1. Basics
# output/figure_1.png: data/input_file_1.csv scripts/generate_histogram.py
#     python scripts/generate_histogram.py -i $< -o $@

# Example for 1. Basics
# output/figure_2.png: data/input_file_2.csv scripts/generate_histogram.py
#     python scripts/generate_histogram.py -i $< -o $@

# Example for 4. Automatic variables and pattern rules
# output/figure_%.png: data/input_file_%.csv scripts/generate_histogram.py
# 	python scripts/generate_histogram.py -i $< -o $@

$(FIGURES): output/figure_%.png: data/input_file_%.csv scripts/generate_histogram.py
	python scripts/generate_histogram.py -i $< -o $@

# Example for 4. Automatic variables and pattern rules
# output/report.html: report/report.md output/figure_1.png output/figure_2.png
# 	cd report/ && pandoc report.md --to html -o ../$@

# Example for 4. Automatic variables and pattern rules
output/report.html: report/report.md $(FIGURES)
	cd report/ && pandoc report.md --to html -o ../$@

debug:  ## debug info
	$(info $$DATA = $(DATA))
	$(warning $$DATA = $(DATA))
	$(error $$FIGURES = $(FIGURES))

clean:  ## clean intermediate outputs
	rm -f output/report.html
	rm -f $(FIGURES)
