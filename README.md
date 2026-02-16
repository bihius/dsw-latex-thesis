# Praca Inżynierska - Guard Proxy

Osobne repozytorium git dla tekstu pracy inżynierskiej.

## Struktura

- `chapters/` - rozdziały pracy (markdown)
- `bibliography/` - bibliografia (BibTeX)
- `templates/` - szablony LaTeX/Pandoc
- `output/` - wygenerowane pliki (PDF/DOCX) - nie commitowane

## Workflow z Obsidian

### Instalacja pluginu Obsidian Git

1. W Obsidian: Settings → Community plugins → Browse
2. Szukaj "Obsidian Git"
3. Install & Enable

### Konfiguracja auto-commitów

Settings → Obsidian Git:
- **Auto-commit**: Enable
- **Commit message**: `docs: auto-commit {{date}}`
- **Auto-commit interval**: 10 minutes (lub według preferencji)
- **Auto pull interval**: 5 minutes
- **Auto backup after file change**: Enable (opcjonalnie)

### Komendy (Cmd+P)

- `Obsidian Git: Commit all changes` - ręczny commit
- `Obsidian Git: Push` - wyślij na remote
- `Obsidian Git: Pull` - pobierz zmiany

## Remote backup (opcjonalnie)

Aby backupować na GitHub/GitLab:

```bash
cd thesis
git remote add origin git@github.com:twoj-user/thesis-backup.git
git branch -M main
git push -u origin main
```

## Build

```bash
make pdf    # generuje PDF
make docx   # generuje DOCX
make all    # oba formaty
```
