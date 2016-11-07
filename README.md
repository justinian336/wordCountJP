# wordCountJP

Japanese language is different to English language in the sense that there is no natural separation between words. There are no spaces between words, and punctuation signs are less utilized. The fact that a phrase in Japanese can easily include characters in four different alphabets (romaji, hiragana, katakana and kanji) makes word separation even more complicated.

This repository provides an interface to analyze datasets by constructing a frequency tables for the words contained in a column of strings. The backend uses the [**jProcessing**](https://github.com/kevincobain2000/jProcessing) library to tokenize the phrases provided in an input file, and [**Pandas**](http://pandas.pydata.org/) in order to construct the frequency table. 

## The following libraries are employed:

- [CRF++ v0.58](https://drive.google.com/drive/folders/0B4y35FiV1wh7fngteFhHQUN2Y1B5eUJBNHZUemJYQV9VWlBUb3JlX0xBdWVZTWtSbVBneU0)
- [Mecab](http://taku910.github.io/mecab/)
- [the Ipa dictionary](http://taku910.github.io/mecab/)
- [CaboCha-0.69](https://drive.google.com/drive/folders/0B4y35FiV1wh7cGRCUUJHVTNJRnM)

## Installation:

1) Clone this repository
2) Navigate to the repository directory: `cd wordCountJP`
3) Build the docker image: `docker build -t wordCountJP .`
4) Run the docker container on the port 8080: 'docker run -p 8080:8080 wordCountJP' (setup your port forwarding options if necessary)
5) Open the interface in your browser by navigating to http://localhost:8080/
6) Upload a `.txt` file encoded in Shift-JIS, containing only one column with phrases on each row. Be sure to delete the empty rows!
7) A file containing the frequency of each word will be downloaded automatically when the analysis is finished.

#LICENSE

Copyright (c) 2016, Juan Nelson Martínez Dahbura <jnelsonm64@gmail.com>

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.