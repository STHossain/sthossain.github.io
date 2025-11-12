# Citation Color Customization Guide

I've added citation styling to your `custom.scss` file to color citations like LaTeX's hyperref package.

## Current Settings

Citations (like "Hansen (2022)") will now appear in **blue (#0066cc)** and turn **darker blue (#004499)** on hover.

## How to Customize Colors

Edit `/home/tanvir/Documents/ownCloud/Git_Repos/sthossain.github.io/custom.scss` and modify these values:

### Change Citation Color

```scss
// Change the main citation color
a[href^="#ref-"] {
  color: #0066cc;  // Change this color
}

// Change hover color
a[href^="#ref-"]:hover {
  color: #004499;  // Change this color
}
```

### Popular Color Options

```scss
// Classic blue (current)
color: #0066cc;

// Dark red (like many LaTeX styles)
color: #8B0000;

// Purple
color: #800080;

// Teal
color: #008080;

// Dark green
color: #006400;

// Orange
color: #FF8C00;
```

## Additional Styling Options

### Remove underline completely
```scss
a[href^="#ref-"] {
  color: #0066cc;
  text-decoration: none;  // No underline
}

a[href^="#ref-"]:hover {
  color: #004499;
  text-decoration: none;  // No underline even on hover
}
```

### Make citations bold
```scss
a[href^="#ref-"] {
  color: #0066cc;
  font-weight: 600;  // or 700 for bolder
}
```

### Add a subtle box around citations
```scss
a[href^="#ref-"] {
  color: #0066cc;
  padding: 2px 4px;
  border-radius: 3px;
  background-color: rgba(0, 102, 204, 0.1);
}
```

## LaTeX hyperref-like Colors

To match common LaTeX hyperref color schemes:

### Classic (blue links, magenta citations)
```scss
a[href^="#ref-"] {
  color: #8B008B;  // Magenta for citations
}
```

### All blue (common default)
```scss
a[href^="#ref-"] {
  color: #0000EE;  // Classic web blue
}
```

### Dark/Conservative
```scss
a[href^="#ref-"] {
  color: #000080;  // Navy blue
  text-decoration: none;
}
```

## After Making Changes

1. Save `custom.scss`
2. The Quarto preview will auto-refresh (if running)
3. Or run: `quarto render` to rebuild

## Testing

Your citations should now appear colored. Test with:
- In-text citations: `@hansen2022econometrics` → Hansen (2022) in blue
- Parenthetical: `[@hansen2022econometrics]` → (Hansen, 2022) in blue
- Clicking should navigate to the reference list

Enjoy your LaTeX-style citation colors! 🎨
