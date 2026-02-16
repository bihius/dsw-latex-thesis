# Szablon pracy inzynierskiej DSW (wersja robocza)

To repozytorium zawiera **roboczy** szablon pracy inzynierskiej przygotowany dla Uniwersytetu Dolnoslaskiego DSW we Wroclawiu.

Uwaga: ten szablon **nie jest jeszcze oficjalnie zatwierdzonym wzorem** uczelni. Traktuj go jako punkt startowy i zawsze porownuj z aktualnymi wymaganiami promotora oraz wytycznymi wydzialu.

Jest zgodny z zarządzeniem nr 70/2024 Dziekana Wydziału Studiów Stosowanych Uniwersytetu Dolnośląskiego DSW we Wrocławiu z dnia 7 października 2024 r. Link: https://www.dsw.edu.pl/sites/dsw/files/2025-11/zd24_70.dyplomowanie_scalone_0.pdf

## Dla kogo i po co

Ten szablon jest dla studentow, ktorzy chca pisac prace inzynierska w Markdown i skladac ja do PDF przez Pandoc. Repo jest publiczne i celowo nie zawiera prywatnych danych autora.

## Co tu znajdziesz

- `metadata.yaml.example` - przykladowe metadane strony tytulowej (skopiuj do `metadata.yaml` i uzupelnij).
- `chapters-example/` - neutralne przykladowe rozdzialy, zeby wystartowac bez pustej strony.
- `templates/` - szablony LaTeX odpowiadajace wymaganiom formatowania.
- `bibliography/references.bib` - przykladowa bibliografia (publiczny wzor).
- `bibliography/references.private.bib` - Twoje zrodla (plik ignorowany przez Git).
- `instrukcja.md` - uniwersalny przewodnik jak pisac prace i jak uzywac szablonu.

## Szybki start (pierwsze uruchomienie)

```bash
cp metadata.yaml.example metadata.yaml
mkdir -p chapters
cp chapters-example/*.md chapters/
make
```

Domyslny wynik builda: `output/praca_inz.pdf`.

## Wymagania

- `pandoc`
- TeX Live / MacTeX z `xelatex`
- opcjonalnie `make`

## Jak dalej pracowac

- Edytuj rozdzialy w `chapters/` (pliki sortuja sie alfabetycznie po nazwie).
- Uzupelnij dane w `metadata.yaml` (autor, promotor, tytul itd.).
- Dodawaj zrodla do `bibliography/references.private.bib` i cytuj je w tekscie przez `[@klucz]`.
- Pelne wytyczne i przyklady skladni sa w `instrukcja.md`.

## Kompilacja bez Makefile

Jesli nie chcesz uzywac `make`, mozesz budowac bezposrednio:

```bash
pandoc --metadata-file=metadata.yaml --template=templates/dsw-thesis.latex --csl=csl/dsw-footnote.csl --bibliography=bibliography/references.bib --pdf-engine=xelatex --citeproc --number-sections --resource-path=.:assets -o output/praca_inz.pdf chapters/*.md
```

## Bibliografia

Publiczny przyklad jest w `bibliography/references.bib`.
Twoje prywatne zrodla wpisuj do `bibliography/references.private.bib` (plik jest w `.gitignore`).
