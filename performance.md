
# System Summary & Profiling Tools

```bash
mkdir ~/profiling
cd ~/profiling
wget http://aspersa.googlecode.com/svn/trunk/align # eg: align vmstat
wget http://aspersa.googlecode.com/svn/trunk/pmp
wget http://aspersa.googlecode.com/svn/trunk/ioprofile
wget http://aspersa.googlecode.com/svn/trunk/diskstats
wget http://aspersa.googlecode.com/svn/trunk/summary
chmod -c 770 *
sudo ./summary
sudo ./ioprofile -p 2263 -s 100
# profile pid 2263 60 times, delayed by 10 sec
sudo ./pmp  -p 31395 -i 120 -s 2

sudo ./ioprofile -p 2263 -s 100
```

