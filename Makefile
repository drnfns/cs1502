graphs         = $(wildcard graphs/*.gv)
graphs_outdir  = docs/static
target_graphs  = $(patsubst graphs/%.gv, $(graphs_outdir)/%.svg, $(graphs))
prose          = $(filter-out docs/index.md, $(wildcard docs/*.md))
prose_outdir   = docs/pdfs
target_prose   = $(patsubst docs/%.md, $(prose_outdir)/%.pdf, $(prose))

all: $(graphs_outdir) $(graphs) $(target_graphs) $(prose_outdir) $(prose) $(target_prose)

$(graphs_outdir):
	mkdir -p $(graphs_outdir)

$(prose_outdir):
	mkdir -p $(prose_outdir)

$(graphs_outdir)/%.svg: graphs/%.gv
	dot -Tsvg $< > $@

$(prose_outdir)/%.pdf: docs/%.md
	pandoc --resource-path docs -i $< -o $@

format:
	deno fmt $(prose) --line-width=72 -q

clean:
	rm -rf $(graphs_outdir) $(prose_outdir)

.PHONY: all clean
