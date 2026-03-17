# moccolor.vim

moccolor は、もくたんさんが自分の開発環境のために作ったカラースキームです。

## 設計哲学

### 256色ターミナルカラーベース

このカラースキームは ASCII 256色のターミナルカラーで構成されています。表示に恵まれない端末でも見た目がダウングレードしないことを重視しています。GUI カラー（`#rrggbb`）も 256色パレットに対応する色を選んでいるため、cterm でも gui でも同じ見た目になります。

### 行ハイライトは「暗くする」方向で強調

moccolor 最大の特徴。通常のダークテーマは行の背景を明るくする方向で目立たせますが、白い文字と明るくなった背景でコントラストが下がり、見たい行が見づらくなる問題があります。moccolor はこれを逆転させ、背景を `#000000`（真っ黒）にすることでコントラストを上げて強調します。

- **Normal の bg** = `#262626`（gray1、少し明るい黒）
- **CursorLine の bg** = `#000000`（真っ黒）

ColorColumn, CursorColumn, Folded, FoldColumn, SignColumn, LineNr なども bg が `#000000` で統一されています。

## カラーパレット

ダークテーマ（`background=dark`）。

**ベース**：black (`#000000`) → gray1〜6 の段階的グレースケール

**アクセントカラー**：

| 名前 | GUI | cterm | 用途 |
|------|-----|-------|------|
| green | `#87d787` | 114 | Constant |
| blue | `#afafff` | 147 | Statement, Preproc, Type, Underlined, Directory, Title |
| light_blue | `#87d7d7` | 116 | Identifier |
| purple | `#d787ff` | 177 | Special |
| red | `#ff8787` | 210 | Error, SpellBad |
| orange | `#d7af5f` | 179 | Todo, WarningMsg |
| yellow | `#878700` | 100 | Search |

## 広がり

vim で作って出来栄えが良かったので、ターミナル（WezTerm, Alacritty, foot）、tmux、lualine、waybar など開発環境全体に適用されています。`colors/moccolor.vim` のパレット定義が全ての基準です。

## ファイル構成

```
colors/moccolor.vim   <- 本体（カラースキーム定義）
```

## 実装の構造（colors/moccolor.vim）

1. **ヘルパー関数**（L10-77）：`s:hi()` で辞書に蓄積、`s:hi_gui()` / `s:hi_cterm()` で GUI/cterm 属性を分離して重ね掛け、最後に `s:set_highlights()` で一括適用
2. **カラーパレット定義**（L79-114）：`s:color_gui` / `s:color_cterm` の変数ペア
3. **ハイライト定義**（L116-218）：構文グループ → UI グループの順で GUI/cterm それぞれ定義
4. **リンク**（L220-235）：`hi! link` で派生グループ
5. **ターミナル色**（L237-254）：`g:terminal_ansi_colors` で ANSI 16色

## 今後の構想

### リポジトリ戦略

リポジトリ名を `moccolor`（`.vim` を外す）にリネームして、vim 以外のカラースキームも同居させるモノレポ構成を検討中。vim はルートの `colors/` を探すので、リポジトリ名が `.vim` でなくても動く。

```
moccolor/
├── colors/moccolor.vim       <- vim/neovim（現状のまま）
├── fish/conf.d/moccolor.fish <- fish
├── alacritty/moccolor.toml   <- Alacritty
└── ...
```

### やりたいこと

- **ライトテーマの作成**
- **ハイライトグループの拡充** — 設定途中で力尽きた分がある
- **tree-sitter キャプチャグループ対応** — Neovim の `@keyword`, `@function`, `@variable` などに色を設定して、より細かい色分けを実現
- **vim script のレビュー** — ちゃんと書けているか確認
- **vim / neovim 両対応の確認** — `has('nvim')` チェックが L63 に1箇所あるが十分か
- **他の vim プラグインへの対応** — easymotion 以外にも moccolor パレットで統一したいプラグインがあるはず
- **fish プラグインとして提供** — `set fish_color_*` 変数で moccolor パレットを適用
- **公開を見据えたメンテ方法** — README の充実、スクリーンショットなど
