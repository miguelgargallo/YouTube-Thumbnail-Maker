# YouTube Thumbnail Maker
This is a simple script to make thumbnails for youtube videos. It uses python and bash.

<img width="640" alt="2022-12-27-19-45-11-Youtube Thumbnail-Maker by-miguelgargallo" src="https://user-images.githubusercontent.com/5947268/209715811-f245c4e2-a7f4-493c-81f4-5e4029c939da.png">

## Table of contents
- [YouTube Thumbnail Maker](#youtube-thumbnail-maker)
  - [Table of contents](#table-of-contents)
  - [Inside this project](#inside-this-project)
  - [What is this project about?](#what-is-this-project-about)
  - [About the dependencies](#about-the-dependencies)
  - [How to use it](#how-to-use-it)

## Inside this project

```
* Youtube Thumbnail Maker
├── Branding
│   ├── Youtube Thumbnail Maker-1.png
│   └── Youtube Thumbnail Maker-2.png
├── .gitignore
├── License.md
├── Readme.md
├── core
│   ├── dependencies.sh
│   ├── records.sh
│   └── thumbnails.sh
└── run.sh
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
./run.sh
```

That's it!

It will do the rest, it will ask you for 5 keywords on the console, just answer and enjoy!

At the end you will have 2 new folders:
- Thumbnails: with the thumbnails
- Records: here it will automatically register the keywords you have used

<img width="640" alt="2022-12-27-19-45-00-Youtube Thumbnail-Maker by-miguelgargallo" src="https://user-images.githubusercontent.com/5947268/209715816-bcf9f7a8-f55b-4552-97e0-890815fc4b06.png">

2022 © All rights reserved. Pylar creative ML License. Pencil Works LLC.
