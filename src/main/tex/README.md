# Building the Paper

Follow these instructions:
* <https://github.com/Hannah-Sten/TeXiFy-IDEA/wiki/Installation>
* <https://miktex.org/download>
* <https://miktex.org/howto/install-miktex-mac>

You will almost inevitably need a bit of hand-holding. Reach out to @andrew-selvia for help.

Add ieeetran as a submodule:

```shell
git submodule add git@github.com:sirilla/ieeetran.git src/main/tex/ieeetran
```

## Run Configuration

Switch the compiler to **LuaLaTeX** to avoid running out of memory while generating plots with large numbers of data
points as suggested [here](https://tex.stackexchange.com/questions/7953/how-to-expand-texs-main-memory-size-pgfplots-memory-overload#comment30336_7965).

Add the following argument to the main run configuration: **Custom compiler arguments**: `-shell-escape`.
