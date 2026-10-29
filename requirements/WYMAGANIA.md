# Wymagania formalne pracy inżynierskiej — Uniwersytet DSW Ideis (Wydział Studiów Stosowanych)

Zebrane 2026-10-29 z oficjalnych dokumentów uczelni (`ideis.pl/wroclaw/strefa-studenta/dziekanat`) + kurs Moodle
„Seminarium dyplomowe 3" (`course id=8102`). Pliki źródłowe leżą w tym katalogu, żeby nie trzeba było ich szukać.

## Źródła

| Plik | Co reguluje |
|---|---|
| `zd24_70_dyplomowanie.pdf` | Zarządzenie Dziekana nr 70/2024 (7.10.2024) — całość dyplomowania, zał. 1–6 |
| `zd24_70_z2_wymogi_prac.pdf` | Zał. 2 — wymogi prac dyplomowych (objętość, rozdziały, bibliografia) |
| `zd24_70_z4_wymogi_edytorskie.pdf` | Zał. 4 — wymogi edytorskie + opis bibliograficzny |
| `zr_26_09_91_egzamin_dyplomowy.pdf` | Zarządzenie Rektora nr 91/2026 (30.09.2026) — procedura egzaminu dyplomowego, APD; obowiązuje od 1.10.2026 |
| `zr_26_04_52_z5_wzor_strony_tytulowej.docx` | Wzór strony tytułowej (zał. 5 do Zarz. Rektora 52/2026) |
| `zr_26_04_52_z6_oswiadczenia.docx` | Wzór oświadczenia przy rejestracji pracy (zał. 6) |
| `dziek_016_zmiana_tematu.docx` | Podanie o zmianę tematu pracy (PL/EN) |
| `moodle/2026 Seminarium dyplomowe 3 - karta przedmiotu.pdf` | Karta przedmiotu Seminarium 3 (Moodle 8102) |
| `moodle/Seminarium 3 - Wyklad 1.pptx` | Wykład 1 z Seminarium 3 (Moodle 8102) |

## Wymogi merytoryczne (Zał. 2, pkt I.1)

- Praca inżynierska = **20–50 stron**.
- **3 rozdziały**; zachowana proporcjonalność objętości; same rozdziały **nie mniej niż 20 stron**.
- Wymagana **część praktyczna** (charakter projektowy / wdrożeniowy / studium problemu praktycznego akceptowalny).
- Dopuszczalna prezentacja multimedialna **do 15 min** — zaznaczyć w pracy, recenzent uzupełnia w recenzji.
- **Minimum 20 pozycji bibliograficznych** o charakterze merytorycznym, **cytowanych w tekście**; pozycje w spisie, ale niecytowane, nie liczą się do wymogu.
- Temat zgodny z kierunkiem, uzgodniony z promotorem, zatwierdzony przez Zespół Dziekański (faktycznie: Radę Programową Kierunku — ZR 91/2026 §3).

## Wymogi edytorskie (Zał. 4)

- A4, wydruk dwustronny.
- Times New Roman 12 pkt, **interlinia 1,5**, wcięcie akapitowe 1,25 cm.
- Marginesy: góra/dół/lewo/prawo **2,5 cm**; wyrównanie do obu marginesów.
- Przypisy dolne: TNR 10 pkt, pojedyncza interlinia, bez wcięć.
- **Dzielenie wyrazów wyłączone** w całym dokumencie (także w przypisach).
- Numeracja ciągła wszystkich stron, **prawy dolny róg**.
- Opis bibliograficzny wg wzoru z Zał. 4 (przypisy dolne, nie styl harwardzki): `Nazwisko I., *Tytuł kursywą,* Wydawnictwo, Miejsce Rok, s. X.`

## Struktura (Zał. 2, pkt II)

1. Strona tytułowa wg wzoru wydziałowego (Zał. 5).
2. Spis treści z numeracją stron.
3. Wstęp: istota i waga problemu, cele pracy, metody, skrót zawartości rozdziałów, opis źródeł.
4. Rozdziały merytoryczne.
5. Zakończenie.
6. Bibliografia / spis piśmiennictwa.
7. Spisy rysunków, tabel (jeśli są), wykaz skrótów, słowniczek, załączniki.

## APD i oddanie pracy (ZR 91/2026 §4)

- Rejestracja pracy w **APD** (`apd.ideis.pl`) — **najpóźniej 14 dni przed egzaminem dyplomowym**.
- Wersja elektroniczna: **jeden plik PDF** + załączniki w jednym archiwum **ZIP/RAR/7Z**.
- Promotor uruchamia badanie w **JSA** (Jednolity System Antyplagiatowy) i akceptuje raport ogólny bez znamion plagiatu.
- **Wydruk wyłącznie z APD** po zatwierdzeniu przez promotora, z **numerem kontrolnym** z systemu.
- Wydruk składany w Dziekanacie: **biała teczka z gumką**, dodatkowa strona tytułowa naklejona, kartki luźne (nieoprawione).
- Po zatwierdzeniu promotor zawiadamia Dziekanat, studenta i komisję o terminie egzaminu i składzie komisji.

## Egzamin dyplomowy (ZR 91/2026)

- Komisja: przewodniczący (Menedżer Kierunku lub osoba wyznaczona) + promotor + recenzent.
- Recenzent: co najmniej doktor; magister tylko za zgodą Dziekana w uzasadnionym przypadku.
- Negatywna ocena pierwszego recenzenta → Dziekan wyznacza drugiego recenzenta.
- Zmiana terminu egzaminu, egzamin zdalny — zgoda Dziekana/Prodziekana (wzór podania na stronie Dziekanatu).

## Stan repo vs wymogi (audyt 2026-10-29)

- `metadata.yaml`: marginesy 2,5 cm, TNR 12 pkt, `csl/dsw-footnote.csl` (przypisy dolne) — **zgodne**.
- `linestretch: 1.25` — świadome odstępstwo od „1,5" (w LaTeXu 1,5 daje luźniej niż Word); **do potwierdzenia z promotorem**.
- Numeracja stron: szablon `_typst`/LaTeX — sprawdzić, czy numer faktycznie ląduje w **prawym dolnym** rogu.
- Rozdziały: obecnie 5 merytorycznych + wstęp + zakończenie (01–07), a Zał. 2 mówi o **3 rozdziałach** — **do uzgodnienia z promotorem** (dr inż. S. Owczarzak), zanim pójdzie do recenzji.
- Bibliografia: `references.private.bib` 28 wpisów + `references.bib` 4 → próg 20 cytowanych pozycji **na granicy**, sprawdzić `make check` i faktyczne cytowania w tekście.
- Objętość: ~18,8 tys. słów w `chapters/` — mieści się w 20–50 stron, ale **nie zbudowano jeszcze PDF** w tym środowisku (brak pandoc/xelatex/typst w kontenerze) — liczbę stron potwierdzić na Macu przez `make`.

## Zrobione / do zrobienia

- [x] Wymogi + wzory pobrane (ten katalog)
- [x] Materiały Moodle 8102 pobrane (`moodle/`)
- [ ] Potwierdzić u promotora: liczba rozdziałów (3 vs 5) i interlinia 1,25 vs 1,5
- [ ] `make` na Macu → sprawdzić liczbę stron, numerację w prawym dolnym rogu, spis rysunków
- [ ] Rejestracja w APD min. 14 dni przed egzaminem (data egzaminu z USOS)
