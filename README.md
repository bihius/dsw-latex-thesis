# Szablon pracy inżynierskiej DSW (wersja robocza)

To repozytorium zawiera **roboczy** szablon pracy inżynierskiej dla Uniwersytetu Dolnośląskiego DSW we Wrocławiu.

> Uwaga: ten szablon **nie jest oficjalnie zatwierdzonym wzorem** uczelni. Traktuj go jako punkt startowy i zawsze porównuj z aktualnymi wymaganiami promotora oraz wytycznymi wydziału.

Szablon jest zgodny z zarządzeniem nr 70/2024 Dziekana Wydziału Studiów Stosowanych Uniwersytetu Dolnośląskiego DSW we Wrocławiu z dnia 7 października 2024 r.:  
https://www.dsw.edu.pl/sites/dsw/files/2025-11/zd24_70.dyplomowanie_scalone_0.pdf

## Dla kogo

Dla studentów, którzy nie lubią produktów firmy Microslop lub preferują Markdown

## Zawartość repozytorium

- `metadata.yaml.example` — przykładowe metadane strony tytułowej (skopiuj do `metadata.yaml` i uzupełnij).
- `chapters-example/` — przykładowe rozdziały startowe.
- `templates/` — szablony LaTeX zgodne z wymaganym formatowaniem.
- `bibliography/references.bib` — publiczny przykład bibliografii.
- `instrukcja.md` — przewodnik pisania i pracy z szablonem.

## Wymagania

- `pandoc`
- TeX Live / MacTeX z `xelatex`
- opcjonalnie: `make`

## Szybki start

```bash
cp metadata.yaml.example metadata.yaml
mkdir -p chapters output bibliography
cp chapters-example/*.md chapters/
touch bibliography/references.private.bib
make
```

Domyślny wynik kompilacji: `output/praca_inz.pdf`.

## Codzienna praca

- Edytuj rozdziały w `chapters/` (pliki są łączone alfabetycznie po nazwie).
- Uzupełnij dane w `metadata.yaml` (autor, promotor, tytuł itd.).
- Dodawaj własne źródła do `bibliography/references.private.bib` i cytuj je przez `[@klucz]`.
- Szczegółowe wytyczne i przykłady składni znajdziesz w `instrukcja.md`.

## Najczęściej używane polecenia

```bash
make           # buduje PDF
make clean     # czyści wygenerowane pliki
make debug     # generuje pośredni plik .tex
make check     # sprawdza, czy Pandoc parsuje pliki
make help      # pokazuje listę komend
```

## Kompilacja bez Makefile

Jeśli nie chcesz używać `make`, możesz uruchomić Pandoc bezpośrednio:

```bash
pandoc --metadata-file=metadata.yaml --template=templates/dsw-thesis.latex --csl=csl/dsw-footnote.csl --pdf-engine=xelatex --citeproc --number-sections --resource-path=.:assets -o output/praca_inz.pdf chapters/*.md
```
