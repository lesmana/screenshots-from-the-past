#! /bin/awk -f

# expected input is output of md5sum sorted by filename
# output is duplicate count and duplicate filenames

# expects parameter show1 set to true or false

{
  md5sum = $1
  filename = $2
  # map filename to md5sum
  md5sums[filename] = md5sum
  # note first filename for each md5sum
  if(!firstfilenames[md5sum]) {
    firstfilenames[md5sum] = filename
  }
  # note every filename for each md5sum
  dups[md5sum][filename] = 1
}


END {
  # sort array by values, discard old index, overwrite old array
  asort(firstfilenames)
  for(i in firstfilenames) {
    md5sum = md5sums[firstfilenames[i]]
    # sort array by index, discard old values, store in new array
    asorti(dups[md5sum], dupfilenames)
    lengthdupfilenames = length(dupfilenames)
    if(lengthdupfilenames != 1) {
      clustercount += 1
      filesinclustercount += lengthdupfilenames
    } else {
      uniquefilescount += 1
    }
    if(lengthdupfilenames != 1 || show1) {
      print lengthdupfilenames
      for(j in dupfilenames) {
        print dupfilenames[j]
      }
    }
  }
  print "total files:", NR
  print "unique files:", uniquefilescount ? uniquefilescount : 0
  print "clusters:", clustercount
  print "files in clusters:", filesinclustercount
}
