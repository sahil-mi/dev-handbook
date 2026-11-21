# Prettier

Formats JS, TS, JSX/TSX, JSON, CSS, HTML, Markdown, YAML. Removes extra blank lines and spaces,
wraps long lines, fixes indentation.

## In Neovim (LazyVim)

Enabled via the `formatting.prettier` extra (`:LazyExtras`), installed by Mason.
Works in any project, even without a `.prettierrc` (uses defaults).

| Action | Shortcut |
|---|---|
| Format file | `Space → c → f` |
| Format selection | `V` → select → `Space → c → f` |
| Format on save | automatic (`Ctrl+S` / `:w`) |
| Toggle format on save (all / buffer) | `Space → u → f` / `Space → u → F` |
| Save without formatting | `:noautocmd w` |
| Check which formatter runs | `:ConformInfo` |

If nothing happens, the file probably has a syntax error — Prettier refuses to format broken code.
Check with `]d` (next diagnostic).

## Add to a project

```bash
bun add -d prettier        # or: npm i -D prettier
echo '{}' > .prettierrc
```

Add scripts to `package.json`:

```json
"scripts": {
  "format": "prettier --write .",
  "format:check": "prettier --check ."
}
```

## CLI

```bash
npx prettier --write .                 # format all files
npx prettier --write "app/**/*.tsx"    # format matching files
npx prettier --check .                 # list unformatted files (CI)
npx prettier app/page.tsx              # print formatted output, don't save
npx prettier --file-info app/page.tsx  # show parser / ignored status
```

## Config (`.prettierrc`)

```json
{
  "semi": true,
  "singleQuote": false,
  "tabWidth": 2,
  "printWidth": 80,
  "trailingComma": "all"
}
```

## Ignore files (`.prettierignore`)

```
node_modules
.next
dist
bun.lock
```

## Tailwind class sorting

```bash
bun add -d prettier-plugin-tailwindcss
```

```json
{ "plugins": ["prettier-plugin-tailwindcss"] }
```

## With ESLint

Stop ESLint rules fighting Prettier:

```bash
bun add -d eslint-config-prettier
```

Add it last in `eslint.config.mjs`:

```js
import prettier from "eslint-config-prettier";

export default [
  // ...other configs
  prettier,
];
```
