# Instrukcja pisania pracy inzynierskiej

Ten plik opisuje uniwersalny sposob pracy z szablonem. Jest niezalezny od tematu i zawartosci Twojej pracy.

## Zasady ogolne

- Pisz jasno i rzeczowo. Kazdy rozdzial powinien odpowiadac na konkretne pytanie: po co, co, jak, z jakim efektem.
- Uzywaj jednolitej terminologii w calym dokumencie. Slownik pojec warto ustalic z promotorem.
- Unikaj dygresji, skracaj zdania, trzymaj sie logiki wywodu.
- Kazda teza, definicja, wynik lub rysunek musi byc zrodlem albo Twoim wnioskiem.

## Struktura rozdzialow (przyklad)

1. Wstep {-}
   - Motywacja, cel pracy, zakres, metoda, struktura dokumentu.
2. Analiza problemu / przeglad rozwiazan
   - Kontekst, porownanie podejsc, analiza literatury.
3. Projekt rozwiazania
   - Wymagania, architektura, uzasadnienie decyzji projektowych.
4. Implementacja
   - Kluczowe elementy wykonania, dobory technologii, najwazniejsze fragmenty.
5. Testy / weryfikacja
   - Metody, przypadki, wyniki, interpretacja.
6. Podsumowanie {-}
   - Wnioski, ograniczenia, mozliwe dalsze prace.

## Jak pracowac z rozdzialami

- Pliki rozdzialow sa w `chapters/` i skladaja sie alfabetycznie po nazwie.
- Uzywaj prefiksow numerycznych: `01-`, `02-`, `03-` itd.
- Kazdy rozdzial zaczynaj od naglowka `# Tytul rozdzialu`.
- Dla rozdzialow nienumerowanych dodaj `{-}` po tytule:

```markdown
# Wstep {-}
```

## Cytowania i bibliografia

- Bibliografia jest w `bibliography/references.bib`.
- Cytuj w tekscie przez `[@klucz]`.

Przyklady:

```markdown
Opis metody X oparto o[@example-article].
Wedlug dokumentacji producenta[@example-website, s. 12] ...
```

## Rysunki i tabele

- Grafiki trzymaj w `assets/figures/`.
- W Markdown wstawiaj je z opisem:

```markdown
![Opis rysunku](assets/figures/nazwa-pliku.png){width=80%}
```

Tabele tworz w Markdown i nadaj podpis:

```markdown
| Kolumna A | Kolumna B |
|:---------:|----------:|
| wartosc   | 123       |

: Podpis tabeli
```

## Styl i formatowanie

- Pisz w trybie bezosobowym lub w pierwszej osobie mnogiej, zgodnie z zaleceniami promotora.
- Stosuj jednolity czas (najczesciej terazniejszy dla opisu systemu, przeszly dla testow).
- Nie wklejaj duzych fragmentow kodu bez potrzeby. Lepiej opisac algorytm i pokazac kluczowy fragment.

## Kontrola jakosci

Przed oddaniem wersji:

- Zbuduj PDF przez `make` i przeczytaj calosc.
- Zweryfikuj spis tresci, spis rysunkow i spis tabel.
- Sprawdz cytowania: brakujace zrodla = bledy przy kompilacji.
- Upewnij sie, ze dane osobowe w `metadata.yaml` sa poprawne.

## Kompilacja

Najprosciej:

```bash
make
```

Lub bez `make`:

```bash
pandoc --metadata-file=metadata.yaml --template=templates/dsw-thesis.latex --csl=csl/dsw-footnote.csl --bibliography=bibliography/references.bib --pdf-engine=xelatex --citeproc --number-sections --resource-path=.:assets -o output/praca_inz.pdf chapters/*.md
```
