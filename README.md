# Szablon pracy inzynierskiej DSW (wersja robocza)

To repozytorium zawiera **roboczy** szablon pracy inzynierskiej przygotowany dla Uniwersytetu Dolnoslaskiego DSW we Wroclawiu.

Uwaga: ten szablon **nie jest jeszcze oficjalnie zatwierdzonym wzorem** uczelni. Traktuj go jako punkt startowy i zawsze porownuj z aktualnymi wymaganiami promotora oraz wytycznymi wydzialu.

## Co jest publiczne

- `templates/` - szablony LaTeX
- `csl/` - styl cytowan
- `bibliography/` - przykladowa bibliografia
- `chapters-example/` - przykladowe rozdzialy
- `metadata.yaml.example` - przykladowe metadane
- `thesis.example.md` - scalony przyklad tresci

## Co jest prywatne (ignorowane przez git)

- `metadata.yaml` - dane autora i pracy
- `chapters/` - Twoje wlasne rozdzialy
- `GUIDE.md` / `guide.md`
- `output/` oraz pliki pomocnicze builda

## Wymagania

- `pandoc`
- TeX Live / MacTeX z `xelatex`
- opcjonalnie `make`

## Szybki start

```bash
cp metadata.yaml.example metadata.yaml
mkdir -p chapters
cp chapters-example/*.md chapters/
make
```

Domyslny wynik builda: `output/praca_inz.pdf`.

## Kompilacja przykladu do pliku glównego repo

```bash
pandoc \
  --metadata-file=metadata.yaml.example \
  --template=templates/dsw-thesis.latex \
  --csl=csl/dsw-footnote.csl \
  --bibliography=bibliography/references.bib \
  --pdf-engine=xelatex \
  --citeproc \
  --number-sections \
  --resource-path=.:assets \
  -o thesis.example.pdf \
  chapters-example/*.md
```

W tym srodowisku nie bylo dostepnego `pandoc`, dlatego dolaczony jest plik `thesis.example.md` jako gotowy przyklad tresci.

## Notatka praktyczna

Ten projekt ma sluzyc jako baza edukacyjna dla studentów. Przed zlozeniem pracy sprawdz u promotora:

- zgodnosc strony tytulowej,
- format przypisów i bibliografii,
- wymagania redakcyjne dla Twojego kierunku.
