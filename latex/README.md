LaTex files for a calculus course at the Berufsakademie Dresden, including lecture notes and course exercises.

To create the PDF documents, first make sure you have installed the following packages:

```bash
apt-get install \
 inkscape gnuplot latexmk \
 texlive-latex-extra \
 texlive-latex-recommended \
 texlive-science \
 texlive-fonts-extra \
 texlive-lang-german \
 cm-super \
 python3-pygments
```

Also make sure that `gnuplot`, `inkscape`, and `latexmk` are available in your path. Then cd to this dir and run

```bash
./build.sh
```

To see a list of options, use

```bash
./build.sh -h
```
