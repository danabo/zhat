# zhat
A blog devoted to finding better representations.

Live at http://zhat.io

# Workflow

## Clone

Clone master and hg-pages into separate folders.

```bash
git clone https://github.com/danabo/zhat.git zhat
git clone --single-branch --branch gh-pages \
    https://github.com/danabo/zhat.git zhat-pages
```

## Edit & Preview

In the zhat folder, run

`bundle exec jekyll serve  --drafts`

Modify source in the zhat folder and refresh browser. Server will automatically rebuild preview.

## Build & Publish

```bash
cd zhat
JEKYLL_ENV=production bundle exec jekyll build -d ../zhat-pages
cd ../zhat-pages
git status
git commit -m "build <commit-number>"
git push
```


