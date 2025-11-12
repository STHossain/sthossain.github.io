# How to Use Bibliography in Your Posts

## Setup (Already Done)

1. **Created `references.bib`** - A central bibliography file in the root directory
2. **Added bibliography to post YAML** - Each post that needs citations references this file

## How to Add Bibliography to a Post

Add this to your post's YAML front matter:

```yaml
---
title: "Your Post Title"
bibliography: ../references.bib
---
```

## How to Cite References

### In-text Citations

Use `@` followed by the citation key:

- `@hansen2022econometrics` → Hansen (2022)
- `[@hansen2022econometrics]` → (Hansen, 2022)
- `[@hansen2022econometrics, p. 45]` → (Hansen, 2022, p. 45)
- `[@hansen2022econometrics; @angrist2009mostly]` → (Hansen, 2022; Angrist and Pischke, 2009)

### Examples

```markdown
According to @hansen2022econometrics, the CEF is the best predictor...

Many authors discuss this topic [@hansen2022econometrics; @angrist2009mostly].

The result is well-known [see @wooldridge2010econometric, Chapter 2].
```

## Adding References Section

At the end of your post, add:

```markdown
# References

::: {#refs}
:::
```

This will automatically generate a formatted reference list for all citations used in the post.

## Adding New References to references.bib

### Article
```bibtex
@article{author2024title,
  title={Article Title},
  author={Author, First and Second, Author},
  journal={Journal Name},
  volume={10},
  number={2},
  pages={123--145},
  year={2024},
  publisher={Publisher}
}
```

### Book
```bibtex
@book{author2024book,
  title={Book Title},
  author={Author, First},
  year={2024},
  publisher={Publisher Name},
  address={City, State}
}
```

### Working Paper
```bibtex
@techreport{author2024working,
  title={Working Paper Title},
  author={Author, First},
  year={2024},
  institution={Institution Name},
  type={Working Paper},
  number={WP-2024-01}
}
```

## Citation Styles

To use a specific citation style (e.g., APA, Chicago, AEA), add to YAML:

```yaml
csl: https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl
```

Popular styles:
- APA: `apa.csl`
- Chicago: `chicago-author-date.csl`
- IEEE: `ieee.csl`
- Nature: `nature.csl`

Or download a .csl file locally and reference it:
```yaml
csl: path/to/style.csl
```

## Current References Available

Check `references.bib` for available references. Currently includes:
- `hansen2022econometrics`
- `angrist2009mostly`
- `wooldridge2010econometric`
- `hoeffding1963probability`
- `slivkins2019introduction`
