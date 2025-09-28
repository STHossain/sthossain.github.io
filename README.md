# Personal Academic Website

This is a Quarto website template for academics, based on the Ibis project template styling.

## Structure

```
my_website/
├── _quarto.yml          # Main configuration file
├── index.qmd            # Home page with personal info
├── research.qmd         # Research page with publications
├── teaching.qmd         # Teaching page with courses
├── blog.qmd             # Blog listing page
├── posts/               # Blog posts directory
│   ├── first-post/
│   │   └── index.qmd
│   └── research-update/
│       └── index.qmd
├── styles.css           # Custom CSS styles
├── custom.scss          # SCSS theme customization
└── _site/               # Generated website files
```

## Getting Started

1. **Customize the content**: Edit the `.qmd` files to add your personal information
2. **Add your photo**: Add a `profile.jpg` image for the home page
3. **Update configuration**: Modify `_quarto.yml` with your details
4. **Add blog posts**: Create new directories in `posts/` with `index.qmd` files
5. **Customize styling**: Modify `styles.css` and `custom.scss` for your preferred look

## Building the Website

```bash
quarto render
```

## Previewing the Website

```bash
quarto preview
```

## Publishing

You can publish this website to:
- GitHub Pages
- Netlify
- Quarto Pub
- Your own server

See [Quarto publishing guide](https://quarto.org/docs/publishing/) for details.

## Customization Tips

- Update the navbar logo and links in `_quarto.yml`
- Modify color scheme in `custom.scss`
- Add social media links in the footer
- Create additional pages as needed
- Add images to blog posts by placing them in the post directories