THESIS=thesis

THESIS_PDF=$(THESIS).pdf

THESIS_S=$(THESIS).tex



#preamble stuff
SUB_THESIS_S += preamble/formatting.tex
SUB_THESIS_S += preamble/packages.tex
SUB_THESIS_S += preamble/shorthands.tex
SUB_PROSPECTUS_S += preamble/formatting.tex
SUB_PROSPECTUS_S += preamble/packages.tex
SUB_PROSPECTUS_S += preamble/shorthands.tex
#header
SUB_THESIS_S += header/abbreviations.tex
SUB_THESIS_S += header/abstract.tex
SUB_THESIS_S += header/acknowledge.tex
SUB_THESIS_S += header/signatures.tex
SUB_THESIS_S += header/title.tex
#intro
SUB_THESIS_S += intro/intro.tex
#theory
SUB_THESIS_S += theory/theory.tex
#Boosted_dm
SUB_THESIS_S +=Boosted_dm/boosted_dm.tex
SUB_THESIS_S +=Boosted_dm/analysis.tex
SUB_THESIS_S +=Boosted_dm/background_estimation.tex
SUB_THESIS_S +=Boosted_dm/conclusion.tex
SUB_THESIS_S +=Boosted_dm/event_selection.tex
SUB_THESIS_S +=Boosted_dm/halo_models.tex
SUB_THESIS_S +=Boosted_dm/motivation.tex
SUB_THESIS_S +=Boosted_dm/results.tex
SUB_THESIS_S +=Boosted_dm/ring_counting.tex
SUB_THESIS_S +=Boosted_dm/signal_mc.tex
#Detector
SUB_THESIS_S +=sk_detector/sk_detector.tex
SUB_THESIS_S +=sk_detector/calibration.tex
SUB_THESIS_S +=sk_detector/cherenkov_radiation.tex
SUB_THESIS_S +=sk_detector/daq.tex
SUB_THESIS_S +=sk_detector/overview.tex
SUB_THESIS_S +=sk_detector/pmts.tex
SUB_THESIS_S +=sk_detector/tank.tex
SUB_THESIS_S +=sk_detector/water_system.tex
#cv?
SUB_THESIS_S += cv/cv.tex

#bib
SUB_THESIS_S += bibliography.bib

all: $(THESIS_PDF) 

$(THESIS_S): $(SUB_THESIS_S)
	@echo Checking child tex file	


$(THESIS_PDF): $(THESIS_S) $(SUB_THESIS_S)
	lualatex $(THESIS)
	bibtex $(THESIS)
	bibtex $(THESIS)
	lualatex $(THESIS)
	lualatex $(THESIS)
	@./makeProgress.sh
progress: $(THESIS_PDF)
	@./makeProgress.sh

clean:
	@rm -rf *.aux *.log *.lot *.out *.toc *.idx *.dvi *.lof *.tex~ *.bbl *.blg
	@rm *.pdf
distclean: clean
	@(find ./ | grep "\.tex~" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.aux" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.log" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.lot" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.out" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.toc" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.idx" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.dvi" | awk '{print "rm " $$0}' | bash)
	@(find ./ | grep "\.lof" | awk '{print "rm " $$0}' | bash)



