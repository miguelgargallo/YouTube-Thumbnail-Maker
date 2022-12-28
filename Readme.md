# YouTube Thumbnail Maker

This is a simple script to make thumbnails for youtube videos. It uses python and bash.

<img width="640" alt="2022-12-27-22-28-42-YouTube Thumbnail-Maker by-miguelgargallo" src="https://user-images.githubusercontent.com/5947268/209724151-0416a3f2-03d2-4d5e-9829-5957f57eaaae.png">

## Table of contents

- [YouTube Thumbnail Maker](#youtube-thumbnail-maker)
  - [Table of contents](#table-of-contents)
  - [Inside this project](#inside-this-project)
  - [What is this project about?](#what-is-this-project-about)
  - [About the dependencies](#about-the-dependencies)
  - [How to use it](#how-to-use-it)

## Inside this project

```
* YouTube Thumbnail Maker
├── .gitignore
├── examples
│   ├── 2022-12-28-02-15-13-YouTube Thumbnail-Maker by-miguelgargallo.png
│   ├── 2022-12-28-02-15-30-YouTube Thumbnail-Maker by-miguelgargallo.png
│   └── 2022-12-28-02-15-44-YouTube Thumbnail-Maker by-miguelgargallo.png├── License.md
├── Readme.md
├── core
│   ├── dependencies.sh
│   ├── records.sh
│   └── thumbnails.sh
├── play.sh (this is the main script)
├── run.sh
├── run_christmas_red_black.sh
└── run_christmas_red_white.sh
```

## What is this project about?

From python, it uses the following libraries:

- imageio: to read and write images and videos (https://imageio.github.io/)
- Pillow (PIL): to manipulate images (https://pillow.readthedocs.io/en/stable/)

## About the dependencies

Imageio is a very useful library to read and write images and videos. It is very easy to use and it is very fast. It is also very easy to install. It is available on pip and conda.

PIL it is used to manipulate images. It is also very easy to use and it is very fast. It is also very easy to install. It is available on pip and conda.

## How to use it

Just run

```
./play.sh
```

Then it will ask you:

```bash
Choose between run.sh a random color YouTube Thumbnail Maker, or run christmas red black sh, a Christmas themed YouTube Thumbnail Maker with red and black colors or a third option, run.sh a random color YouTube Thumbnail Maker with a white background and red text.
Type 1 for run random color YouTube Thumbnail Maker
Type 2 for run christmas red black themed
Type 3 for run christmas red white themed
Choose 1, 2, or 3: 
```

That's it!

It will do the rest, it will ask you for 5 keywords on the console, just answer and enjoy!

At the end you will have 2 new folders:

- Thumbnails: with the thumbnails
- Records: here it will automatically register the keywords you have used

<img width="640" alt="2022-12-27-22-28-22-YouTube Thumbnail-Maker by-miguelgargallo" src="https://user-images.githubusercontent.com/5947268/209724168-b1313f4a-608e-43aa-b968-c4561d988d9a.png">

2022 © All rights reserved. Pylar creative ML License. Pencil Works LLC.
