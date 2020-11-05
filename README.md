# paf2lastz
Convert PAF with cg cigars to LASTZ cigars

This is a re-implentation of the following [paftools](https://github.com/lh3/minimap2/blob/master/misc/paftools.js) command:
```
paftools view -f lastz-cigar
```
that
* is standalone (ie does not require Javascript)
* incorporates @Robin-Rounthwaite's [fix](https://github.com/Robin-Rounthwaite/reference-based-cactus-aligner/blob/master/src/paf_to_lastz.py#L49-L71)
* provides option (`-q`) to use the PAF MAPQ as the score

usage:
```
paf2lastz a.paf > a.cigar
```
where `a.paf` was created by, for example, `minimap2 -c`
