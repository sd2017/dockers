<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Docker](#docker)
	- [docker install](#docker-install)
- [GIT](#git)
- [linux commandline](#linux-commandline)
	- [gdb](#gdb)
- [Ubuntu](#ubuntu)
- [pythonic](#pythonic)
	- [list comprehension](#list-comperhention)
		- [list comprehention example:finding words in list that contains only specific letters.](#list-comprehention-examplefinding-words-in-list-that-contains-only-specific-letters)
		- [withouth list comprehention example:finding words in list that contains only specific letters.](#withouth-list-comprehention-examplefinding-words-in-list-that-contains-only-specific-letters)
	- [python details](#python-details)
	- [python multiprocessing](#python-multiprocessing)
		- [Lock    MUTEX   acquire-- only one can acquire , release](#lock-mutex-acquire-only-one-can-acquire-release)
			- [with Critical section](#with-critical-section)
		- [new block code...](#new-block-code)
		- [RLock   - rentrent lock  , can be reacuire by same thread , methods calling methods trying to acqire lock in same thread](#rlock-rentrent-lock-can-be-reacuire-by-same-thread-methods-calling-methods-trying-to-acqire-lock-in-same-thread)
		- [Semaphore   - counting lock , acquire - waits if counter is 0 - otherwise decrement  , release increment count](#semaphore-counting-lock-acquire-waits-if-counter-is-0-otherwise-decrement-release-increment-count)
		- [BoundedSemaphore **TBD**](#boundedsemaphore-tbd)
		- [Event   set() , wait()](#event-set-wait)
					- [## This can be used to have one or more](#-this-can-be-used-to-have-one-or-more)
					- [##threads wait for something to occur](#threads-wait-for-something-to-occur)
					- [## Setting an event will unblock all waiting](#-setting-an-event-will-unblock-all-waiting)
					- [##threads simultaneously (if any)](#threads-simultaneously-if-any)
			- [Event Common use : barriers, notification](#event-common-use-barriers-notification)
			- [Using an event to signal "completion"](#using-an-event-to-signal-completion)
					- [#####Done](#done)
	- [Condition](#condition)
					- [## Do something with x](#-do-something-with-x)
		- [python multiprocess design](#python-multiprocess-design)
			- [CPU bound use multiprocessing Process](#cpu-bound-use-multiprocessing-process)
			- [IO bound use multiprocessing  Threading.Thread. `TBD`windows launch is in __main__ !!!](#io-bound-use-multiprocessing-threadingthread-tbdwindows-launch-is-in-main-)
			- [Process do not share same data , do not need locks  , do join , daemon , terminate!](#process-do-not-share-same-data-do-not-need-locks-do-join-daemon-terminate)
			- [python start point in script](#python-start-point-in-script)
		- [unknown exception info](#unknown-exception-info)
- [python sqlite3](#python-sqlite3)
- [Atom](#atom)
		- [ubuntu atom install](#ubuntu-atom-install)
- [networking layer2](#networking-layer2)
- [markdown](#markdown)
	- [H2](#h2)
		- [H3](#h3)
			- [H4](#h4)
				- [H5](#h5)
					- [H6](#h6)

<!-- /TOC -->
#Docker
##docker install

>sudo apt-get update

>sudo apt-get install apt-transport-https ca-certificates

>sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

>echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

>sudo apt-get update

>apt-cache policy docker-engine

>sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

>sudo apt-get install docker-engine

>sudo service docker start

>sudo groupadd docker

>sudo usermod -aG docker $USER

|docker| commands|
| --- | --- |
|`docker ctrl p q`|    exit container without close it|
|`docker exec`  |  running another command in the docker|
|`docker ps -a` ! grep imagename ! awk '{print $1}' ! xargs docker rm   |rm image containers|
|`docker build -t` sd2017ubuntu:1604.01 -m "user"` | Creating new image from docker file in same directory|
|`docker commit -m` "msg"  3bfe6772524e sd2017/ubuntu:04 | Creating image from container|  
|`docker exec `--user root -it clionx /bin/sh |Exec additional command in a running docker |
|`docker history` image  |image rollback  https://gist.github.com/dasgoll/476ecc7a057ac885f0be |
|`docker pull` maven:3.3.9-jdk-7| docker pull image:tag from repository docker hub|
|docker run --name posterTry -e POSTGRES_PASSWORD=database -d postgres:9.6.0|run in detach mode|
|`docker run -itd` --name=maven  maven:3.3.9-jdk-7  /bin/bash | starting pseudo terminal named container, with image and bash command |
|`docker run -itd --link` server3 --name=client3 client_img /bin/bash |run with ****link****|
| `docker ps` / `docker ps -a`| docker list running/stopped containers |
| `docker run -d -name1 wev1 -p` 8081:80|  ****exposing host:guest port****|
|`docker-compose up` | building and running composed docker containers with services|
|`docker images`| list docker images|
| `docker start -i  8508e3ddf819` |activating stopped interactive container|

|>docker images|||||
| ---       | --- | --- | --- | ---|
|REPOSITORY|TAG|IMAGE ID  | CREATED  | SIZE|
|ubuntu|16.04|45bc58500fa3    |    43 hours ago |       126.9 MB|


https://docs.docker.com/engine/tutorials/dockerimages/  building images
https://docs.docker.com/engine/reference/builder/  Dockerfile builder



#GIT

|git|commands|
|---|---|
|git tag   | get list of tags|
|git init   |creating git repository in ./|
|git config --global user.email "sd2017@walla.co.il"||
|git config --global user.name "sd2017"||
|git config --global push.default simple||
|git push --set-upstream origin master|`TBD`|
|git add  --all  |   http://stackoverflow.com/questions/17743549/git-recursively-add-the-entire-folder |
|git commit -am "initial from http://www.qtrac.eu/pipbook-1.0.tar.gz"|`TBD -a`|
|git tag  0.1  -m "initial from http://www.qtrac.eu/pipbook-1.0.tar.gz"|tag number and messege|   
|git push|moving upstream from local to remote repository|
|git pull| updating local repository|
|git pull --rebase `TBD`||
|git fetch --all| get remote repository , http://stackoverflow.com/questions/1125968/how-to-force-git-pull-to-overwrite-local-files 
|git vs svn| http://aliceinfo.cern.ch/Offline/node/2912/#UpdateCommands |
|
|---|---|



#linux commandline

|linux|networking commands|
|---|---|
|netstat -tunlp|n network,l listening ports,p process,t tcp,u udp|
|netstat -a  - all ports both listening  and non listening |
|netstat -l - listening sockets ||
|netstat -a 		||
|netstat -lnap   ||  
|netstat -lnapt  |  - only tcp|
|lsof -i tcp:1555 | https://danielmiessler.com/study/lsof/ |
|lsof  -sTCP:ESTABLISHED -i:2006 ||
|ip route add 10.1.55.0/24 via 10.1.71.1`TBD`||

egrep "\-SRM|0x00000001" two_not_recording_1646_tv_2000_logmerged.cap > two_not_start_SRM_0x1.txt
egrep '(KEY_PRESS|Session_Play|PLAYER_EVENT_SESSION|Record.review.buffer|playerSessionEventListener)' fail.play.sucseed.txt     > fail.play.session.txt
egrep -a $'hudson.lab.' /etc/hosts

|linux|commands|
|---|---|
|diff -u hello.c hello_new.c > hello.patch|creating patch|
|patch < hello.patch| patching one file|
|diff -Naur /usr/src/openvpn-2.3.2 /usr/src/openvpn-2.3.4 > openvpn.patch|creating patch for directory|
|patch -p3 < /root/openvpn.patch|patch skiping p3 leading slashes in the filename|
|patch -b < hello.patch|patch with backup|
|patch --dry-run < hello.patch|validating patch i.e dry run
|patch -R < hello.patch|undo patch | 
|echo '123:456'!  cut -d: -f1 |string coloumns|
| http://unix.stackexchange.com/questions/81349/how-do-i-use-find-when-the-filename-contains-spaces ||
| http://www.linuxjournal.com/article/7385   | brackets braces substitution|
|||


|linux|command|
|---|---|
|exec "$0" "$@"' |  run the script instead of command|
  |  http://superuser.com/questions/878967/what-do-these-parameters-do  |
  |http://askubuntu.com/questions/368509/why-is-0-set-to-bash                                         |
  |   unzip 	  ch0{1,2,3,4,5,6,7,8,9}.zip   | not working because they stuff all the files onto the same command line. While that works with most programs, unzip will take the first argument as the zip file, and any after the first as files to extract from it. You need to execute the command once for each file:|
|nproc|number of processprs|
|lscpu|info on cpu|
|find . -name '*.zip' -exec unzip {} \;|`TBD`|
|find . -name 'cpf.log'  -exec grep 'onverting from' {} \;||
|useradd user||
|userdel user||
|top -b -n 1||
|top -b -c    -n 1 ||
|tree ~/ |display directories structure|

find . -name "*.zip" -print0 | xargs -0 -n1 unzip `unzip multiple files`
lsof -ln -sTCP:ESTABLISHED -i:50039|head -2|tail -1

|wget||
|---|---|
|wget  -nH --cut-dirs=1  -np http://higheredbcs.wiley.com/legacy/college/goodrich/1118290275/dsap/ch0{1,2,3,4,5,6,7,8,9}.zip  |wget removing top site dirs,    get 9 files , 9 inputs to command|
|wget  -r   --no-parent -np   --no-host-directories -nH   http://www.tutorialspoint.com/unix_commands/wget.htm

wget -nc  -nH --cut-dirs=1 http://www.netobjectives.com/resources/books/design-patterns-explained/review-questions

wget -r www.netobjectives.com/resources/books/design-patterns-explained/java-code-examples/

wget -r -np  www.netobjectives.com/resources/books/design-patterns-explained/

wget -r -nh  -np  www.netobjectives.com/resources/books/design-patterns-explained/

wget -r -nH  -np  www.netobjectives.com/resources/books/design-patterns-explained/

wget -r -nH --cut-dirs=2 -np   --convert-links  www.netobjectives.com/resources/books/design-patterns-explained/

download site   wget -r --no-parent site.com

http://www.linuxjournal.com/article/7385   , brackets braces substitution
wget  -nH --cut-dirs=1  -np  http://higheredbcs.wiley.com/legacy/college/goodrich/1118290275/dsap/ch0{1,2,3,4,5,6,7,8,9}.zip    get 9 files , 9 inputs to command



##gdb
(gdb) set solib-absolute-prefix /junk
(gdb) set solib-search-path path/to/uClibc-nptl-0.9.29-20070423
set solib-search-path /disks/clibc_nptl/lib
info locals
info reg
set solib-search-path /disks/uilstore6/disk601/sdagany/gdb_dov/uClibc-nptl-0.9.29-20070423

#Ubuntu

lubuntu lxde fast lightweight  https://help.ubuntu.com/community/Lubuntu/GetLubuntu/LTS http://cdimage.ubuntu.com/lubuntu/releases/xenial/release/
ubuntu gparted.iso disc partition , boot from and resize
apt-get install system-config-lvm    http://askubuntu.com/questions/196125/how-can-i-resize-an-lvm-partition-i-e-physical-volume
apt list --installed
baobab   -->ubuntu disk usage


dpkg -S /usr/lib/debug/usr/lib/x86_64-linux-gnu/libwebkitgtk-3.0.so.0.22.15
sudo apt-get remove   libwebkitgtk-3.0-0-dbg
http://askubuntu.com/questions/712190/files-in-usr-lib-debug-usr-lib-taking-a-lot-of-space-how-to-free-it   diskspace

##resizing lvm partition to use all disk space 
http://ryandoyle.net/posts/expanding-a-lvm-partition-to-fill-remaining-drive-space/
`TODO`shoshan@lubuntu1:~/github/CuteMarkEd$ sudo pvresize /dev/sda5 
  Physical volume "/dev/sda5" changed
  1 physical volume(s) resized / 0 physical volume(s) not resized

shoshan@lubuntu1:~/github/CuteMarkEd$ sudo lvresize -l +100%FREE /dev/mapper/lubuntu--vg-root 
  Size of logical volume lubuntu-vg/root changed from 26.52 GiB (6789 extents) to 81.52 GiB (20870 extents).
  Logical volume root successfully resized.

$ sudo resize2fs  /dev/mapper/lubuntu--vg-root
resize2fs 1.42.13 (17-May-2015)
Filesystem at /dev/mapper/lubuntu--vg-root is mounted on /; on-line resizing required
old_desc_blocks = 2, new_desc_blocks = 6
The filesystem on /dev/mapper/lubuntu--vg-root is now 21370880 (4k) blocks long.


$df



find installed ubuntu packages     >dpkg --get-selections | grep -v deinstall  
search available packages          >apt-cache search keyword

|Ubuntu|commands|
|---|---|
|packages, search  availablity | >apt-cache search keyword|
|packages, install|apt-get install -y build-essential gnome-commander geany meld netbeans codeblocks_ide terminator  |
|packages removal | sudo apt-get remove   libwebkit2gtk-3.0-25-dbg  |
|packages history | grep "\ install\ " /var/log/dpkg.log http://askubuntu.com/questions/21657/how-do-i-show-apt-get-package-management-history-via-command-line |
|grep "\ install\ " /var/log/apt/history.log| packages history formatted |

#pycharm
|run debug |configuration|
|---|---|
|runing several configurations|compound|
|adding project sources to pythonpath|python , checkbox Add source root to PYTHONPATH|
|not running multiuple times|checkbox-Single instance only|
#pythonic
http://www.fullstackpython.com/table-of-contents.html
http://stackoverflow.com/questions/8248397/how-to-know-change-current-directory-in-python-shell

identitiy testing  
a="first" b="first"
assert ( (a is b)  == False)
assert ( (a == b)  == True)
##list comprehension

```python
 new_list = ["something with " + ITEM for ITEM in iterable if condition_based_on(ITEM)]
```

```python
new_list = []
 for ITEM in iterable:
    if condition_based_on(ITEM):
        new_list.append("something with " + ITEM)
```
###list comprehention example:transform and contition for elements
```python

  theoldlist=[1,2,3,4,4,5,6,7,6.5,5.5,4.5,3.5]
  thenewlist = [x + 100 for x in theoldlist if x > 5]
  print "transformed filtered list:{}".format(thenewlist)
```
>transformed filtered list:[106, 107, 106.5, 105.5]


###list comprehention example:finding words in list that contains specific letters.
```python
    wordlist = ['mississippi', 'miss', 'lake', 'que']
    letters = set('aqk')
    list = [word for word in wordlist if (letters & set(word))]
    print "wordlist found:{} containing from :{}".format(list,letters)
```
>wordlist found:['lake', 'que'] containing from :set(['a', 'q', 'k'])


###withouth list comprehention example:finding words in list that contains only specific letters.
```python
wordlist = ['mississippi','miss','lake','que']
letters = set('aqk')
for word in wordlist:
    if letters & set(word):
        print word
```

###python lambda is an anonimous function, used as ad-hoc function.

|long faunction|lambda|
|def prod(a,b) :return a*b |x=lambda a,b: a*b|
|def prod2(a,b=6) :return a*b |y=lambda a,b=6:a*b|
|def tuple_arg(*tup):return tup |z=lambda *tup: tup|
x(5,6)

```python
list_years={1968,1970,1980}
leap_years=filter(lambda n:n%4==0,list_year)  
print "leap_years:{}".format(leap_years)
```
##python details

all python methods are virtual
python multithread daemon threads, threads  exit when parent thread exit
PYTHON CPU-bound threads have  horrible performance properties!!!
multiple pythons  process do have multipython interperter

##python multiprocessing
###Lock    MUTEX   acquire-- only one can acquire , release  

#### with Critical section
```python
with x_lock:
  statements using x
...
###new block code...
with automatically acquires the lock,
releases it when control enters/exits the
associated block of statements
```

```python
x_lock.acquire()
try:
	statements using x
finally:
	x_lock.release()
```


TODO  Don't write code that acquires more than
one mutex lock at a time
56
x = 0
y = 0
x_lock = threading.Lock()
y_lock = threading.Lock()   



### RLock   - rentrent lock  , can be reacuire by same thread , methods calling methods trying to acqire lock in same thread
```python
class Foo(object):
  lock = threading.RLock()
def bar(self):
		with Foo.lock:
		...
def spam(self):
		with Foo.lock:
		...
    self.bar()
		...
```

### Semaphore   - counting lock , acquire - waits if counter is 0 - otherwise decrement  , release increment count
	use --- limithing number of threads doing operation , signaling
### BoundedSemaphore **TBD**

### Event   set() , wait()
```python
e = threading.Event()
e.isSet() # Return True if event set
e.set() # Set event
e.clear() # Clear event
e.wait() # Wait for event
######## This can be used to have one or more
########threads wait for something to occur
######## Setting an event will unblock all waiting
########threads simultaneously (if any)
```

#### Event Common use : barriers, notification
Using an event to ensure proper initialization
```python
init = threading.Event()
def worker():
init.wait() # Wait until initialized
statements
...
def initialize():
statements # Setting up
statements # ...
...
init.set() # Done initializing
Thread(target=worker).start() # Launch workers
Thread(target=worker).start()
Thread(target=worker).start()
initialize()
```
#### Using an event to signal "completion"
```python
	def master():
	...
	item = create_item()
	evt = Event()
	worker.send((item,evt))
	...
	# Other processing
	...
	...
	...
	...
	...
	# Wait for worker
    evt.wait()

	worker()
	item, evt = get_work()
processing
processing
...
...
###########Done
evt.set()
```
## Condition
```python
cv = threading.Condition([lock])
cv.acquire() # Acquire the underlying lock
cv.release() # Release the underlying lock
cv.wait() # Wait for condition
cv.notify() # Signal that a condition holds
cv.notifyAll() # Signal all threads waiting

with items_cv:            Before waiting, you have to acquire the lock
	while not items:       
		items_cv.wait()   ---- wait() releases the lock  when waiting and   reacquires when woken    TBD TODO
	x = items.pop(0)
######## Do something with x
```
import subprocess
p = subprocess.Popen(['python','child.py'],
	stdin=subprocess.PIPE,
	stdout=subprocess.PIPE)

	p.stdin.write(data) # Send data to subprocess
p.stdout.read(size) # Read data from subprocess

###python multiprocess design
####  CPU bound use multiprocessing Process
####  IO bound use multiprocessing  Threading.Thread. `TBD`windows launch is in __main__ !!!
####Process do not share same data , do not need locks  , do join , daemon , terminate!
```python
import time
import multiprocessing
class CountdownProcess(multiprocessing.Process):
	p1 = CountdownProcess(10) # Create the process object
	p1.start()



(c1, c2) = multiprocessing.Pipe()
• Returns a pair of connection objects (onefor each end-point of the pipe)
• Here are methods for communication
	c.send(obj) # Send an object
	c.recv() # Receive an object
	c.send_bytes(buffer) # Send a buffer of bytes
	c.recv_bytes([max]) # Receive a buffer of bytes
	c.poll([timeout]) #Check for data
```

```python
stringnum=str(num)
```

```python
Animal = Enum('Animal', [(a, a) for a in ('horse', 'dog')], type=str)

which gives us:

>>> list(Animal)
[<Animal.horse: 'horse'>, <Animal.dog: 'dog'>]

>>> Animal.dog == 'dog'
True
```
print "If I add %d, %d, and %d I get %d." % (18 my_age, my_height, my_weight, my_age + my_height + my_weight)    
string%s     raw%r decimal%d

print "new '{0}' is longer than '{1}'".format(name1, name2)

```python
list_elements = []
list=range(1,6)  
list.append(v)
```
 ****TBD***   1,2,3,4,5

```python
    for item in  itertools.permutations(string):
        print "item:{0}".format(item)
    lista=list(itertools.permutations(string))
    print "lista",lista
    for index,item in enumerate(lista):
        print "enumerate{0}:{1}:".format(index,item)
```
```python
class Permuter():
    def __iter__(self):
       return self
    def next(self,string):
        if string not in self.cache:
            self.cache[string]=list(itertools.permutations(string))   #expert python programming p318
        if (string !=self.prev_string):
            self.prev_string= string
            self.iter=iter(self.cache[string])
        self.res=self.iter.next()
        return self.res

    def __init__(self):
        self.cache = {}
        self.prev_string = ""
        self.iter = None
        self.cache["abc"] = PermutePure("abc")
        self.lista = self.cache["abc"]
        print "Permuter {0}".format(self.cache)
        print "lista {0}".format(self.lista)
        self.res = None
        self.iter = iter(self.lista)

def permutf(string ):
    lista=list(itertools.permutations(string))
    print "lista {0}".format(lista)
    #a,b=0,1
    itera = iter(lista)
    item = "".join(itera.next())
    while True:
        #yield b
        yield item
        #a,b=b,a+b
        item = "".join(itera.next())


    permf=permutf("abc")
    for ind in xrange(1, 7):
        print "loop ff#{0}:{1}".format(ind, permf.next())

    perme = permutf("abcde")
    for ind in xrange(1, 7):
        print "loop ff#{0}:{1}".format(ind, perme.next())

    perm = Permuter()
    for ind in xrange(1,7):
        print "loop permuter#{0}:{1}".format(ind,perm.next("abc"))
with open("foo.txt", "w") as src1:
  src1.close()        

    try:
	    bla()
	execpt IOError:
       ioblabla()
    except :
        #e = sys.exc_info()[0]
        #print("Error: %s" % e)
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print "*** print_tb:"
        traceback.print_tb(exc_traceback, limit=1, file=sys.stdout)
        print "*** print_exception:"
        traceback.print_exception(exc_type, exc_value, exc_traceback,
                                  limit=2, file=sys.stdout)
        print "*** print_exc:"
        traceback.print_exc()
        print "*** format_exc, first and last line:"
        formatted_lines = traceback.format_exc().splitlines()
        print formatted_lines[0]
        print formatted_lines[-1]
        print "*** format_exception:"
        print repr(traceback.format_exception(exc_type, exc_value,
                                              exc_traceback))
        print "*** extract_tb:"
        print repr(traceback.extract_tb(exc_traceback))
        print "*** format_tb:"
        print repr(traceback.format_tb(exc_traceback))
        print "*** tb_lineno:", exc_traceback.tb_lineno
     finally:
       gaga()
```

```python
python -o
if __debug__
```
####python start point in script
```python
if __name__=="__main__":
empty  __init__.py  --->  from filepy import *
```



Escape What it does.
\\ Backslash (\)
\' Single- quote (')
\" Double- quote (")
\a ASCII bell (BEL)
\b ASCII backspace (BS)
\f ASCII formfeed (FF)
\n ASCII linefeed (LF)
\N{name} Character named name in the Unicode database (Unicode only)
\r ASCII carriage return (CR)
\t ASCII horizontal tab (TAB)
\uxxxx Character with 16- bit hex value xxxx (Unicode only)
\Uxxxxxxxx Character with 32- bit hex value xxxxxxxx (Unicode only)
\v ASCII vertical tab (VT)
\ooo Character with octal value oo
\xhh Character with hex value hh


Keywords
• and
• del
• from
• not
• while
• as
• elif
• global
• or
• with
• assert
• else
• if
• pass
• yield
• break
• except
• import
• print
• class
• exec
• in
• raise
• continue
• finally
• is
• return
• def
• for
• lambda
• try



 if (self.instances.has_key(row[1])):     #check dictionary if key exist
 if (not os.path.isfile("console")):      #check if file exist
 if (1<=len(self.token_list)):            #check length of list
 def __init__(self):                      #constructor
 super(dbasset,self).__init__()           #call base constructor
 super(C).__init__()  --->  super(C,self).__init__()       #fix super call error -    TypeError: super() takes at least 1 argument (0 given)
 Make an empty file called __init__.py in the same directory as the files         #import from same/relative directory
 from user import User                                                            #import User class from user.py
 some_object_type=some_object.__class__.__name__                                  #getting type of object

    def __hash__(self):                                                           #making object suitable to use as a key in dictionary   
        return hash((self.name, self.index))
    def __eq__(self, other):
        return (self.name, self.index) == (other.name, other.index)

self.f=fileinput.input("-")                                                      #open stdin   parameter "-"  to override any parameter

 user.py shoul move independent not imported code to :
 if __name__ == "__main__":
    mytest = test()
random from iterated item  print(random.choice(foo))   
from random import randrange
random_index = randrange(0,len(foo))
http://stackoverflow.com/questions/306400/how-do-i-randomly-select-an-item-from-a-list-using-python
instanciating class from class name
====================================
theclass = getattr(module, "MyClass")
to get the class itself, and then call it as normal to instantiate it:
instance = theclass(args)

or instantiate class using globals
==================================
from somemodule import * # imports SomeClass
someclass_instance = globals()['SomeClass']()


creating module name
======================
module = sys.modules["my_file"]
other_module=sys.modules["other_file"]


if __name__ == "__main__":
             the_module = sys.modules["__main__"]
           else:  
             the_module = sys.modules[class_module]
           the_class  = getattr(the_module, class_name)
           the_instance=the_class()



 string+str(some_int)                                                             #concatinating_string and integer
 int("5")                                                                         #convert string to integer
 lista_withouth_last_element=lista[0:-1]                                          #list withouth last element
https://pymotw.com/2/logging/
http://stackoverflow.com/questions/14058453/making-python-loggers-output-all-messages-to-stdout-in-addition-to-log
 self.FSMhandlers=dict(zip(self.FSMstates,[None,self.handler_time_first,self.handler_time_one]))    #creating dictionary from 2 lists of keys and values   , zip do the connecting hash
 return "%(name)s %(value)s" % {'name':self.name,'value':self.value}              #print with format
 logging.exception("Error: in state machine event[%s] state[%s] ",  (event,self.FSMContainer.FSMstate))     #logging with format
 error:  import: command not found                                                #fix:  #!/usr/bin/python
 logging.info("try logging")   instead logging.exception("try logging exception") #exception can add additional None if not fromatted;  ERROR:root:try logging exception    None
logging.basicConfig(filename='ADSMART_test_wrap_time.log',level=logging.INFO)     #output logging to file
logging.basicConfig(format='%(funcName)s %(lineno)d %(message)s',filename=return_data["log_filename"],level=logging.INFO)

###unknown exception info
```python
except:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            logging.fatal("Error: exc_type[%s] exc_obj[%s]",exc_type,exc_obj)
```

 buf = "A = %d\n , B = %s\n" % (a, b)                                             #sprintf like

import inspect, os                                                                #get running python filename in runtime
print inspect.getfile(inspect.currentframe()) # script filename (usually with path)
print os.path.dirname(inspect.getfile(inspect.currentframe())) # script directory

 logging   http://docs.python.org/library/logging.html
 http://stackoverflow.com/questions/4219717/how-to-assert-output-with-nosetest-unittest-in-python
 http://stackoverflow.com/questions/9534245/python-logging-to-stringio-handler
     self.stream = StringIO()
        self.handler = logging.StreamHandler(self.stream)
        self.log = logging.getLogger('mylogger')
        self.log.setLevel(logging.INFO)
        for handler in self.log.handlers:
            self.log.removeHandler(handler)
        self.log.addHandler(self.handler)
    def testLog(self):
        self.log.info("test")
        self.handler.flush()
        print '[', self.stream.getvalue(), ']'
        self.assertTrue(self.stream.getvalue(), 'test')

    def tearDown(self):
        self.log.removeHandler(self.handler)
        self.handler.close()

class A(object)  class B(A) __init__() super(B,self).__init__()		http://stackoverflow.com/questions/9698614/super-raises-typeerror-must-be-type-not-classobj-for-new-style-class    solve: TypeError: must be type, not classobj

##python sqlite3

https://github.com/sqlitebrowser/sqlitebrowser/releases
```python
sqlite3 . connect
if is_new:sqlite3.executscript(schema)    
```

##python scipy combining c/cpp 2014 https://www.youtube.com/watch?v=GE8EsGUsC2w

#patterns
https://en.wikipedia.org/wiki/Closure_(computer_programming)

#Atom
http://flight-manual.atom.io/using-atom/sections/find-and-replace/
###ubuntu atom install
   33  sudo add-apt-repository ppa:webupd8team/atom
   34  sudo apt-get update
   35  sudo apt-get install -y atom
   36  sudo apt install npm
   37  apm install terminal-fusion --no-confirm

|key bindings||
|---|---|
|navigate tab|ctrl-tab , ctrl shift-tab|
|settings|ctrl-,|
|goto symbol in file|ctrl-r|
|goto ctag|ctrl-t   http://docs.ctags.io/en/latest/ |
|show command pallate|ctrl-shift-p|
|zoom|ctrl-+ , ctrl--|
|goto begin file, goto end file|ctrl-home , ctrl-end|
|bookmark |alt-ctrl-F2|
|bookmark-next|F2, shift F2|
|bookmark list|ctrl-f2|
|pane split`TODO`|ctrl-k up/down/left/right|
|line move|ctrl-up,ctrl-down|


|package| https://atom.io/packages/list?direction=desc&sort=stars |
|---|---|
|autocomplete-plus||
|markdown-preview|ctrl-shift-m|
|markdown-toc||
|markdown-writer|need to set key-bindings|
|split-diff|ctrl-alt-n|
|git-diff| alt-g d list diffs , alt-g arrow|
|git-plus|ctrl-shift-h `pull before push`  https://github.com/akonwi/git-plus/issues/294 need git add before every git commit |
|git-log||
|git-time-machine||
|language-todo`todo`||
|find-and-replace`todo`||
|project-manager||
|open-recent|File->open|
|Todo-Show||
|minimap|code navigtion|

#Regular Expressions
https://github.com/aloisdg/awesome-regex
https://developers.google.com/edu/python/regular-expressions
Mastering_Python_Regular_expressions.pdf
https://github.com/Apress/regular-expression-recipes `TODO`

|action|syntax|example|
|---|---|---|
|search |search re in all the input|
|match  |matching re to line begin|
|optimized bytecode|compile|compiled_bytecode = re.compile(r'word:\w\w\w', str)|
|using bytecode in line begin|match|match = compiled_bytecode.search(str)|
|searching in string|search|match = re.search(r'word:\w\w\w', str)|
|found list corresponding to regex list|group|match.group() match.group(0)  |
|found first elemnt in list corresponding to regex list|group|match.group(1)|
| group not exist|IndexError|match.group() match.group(999)  |
|regular expression raw string|r|r''word:\w\w\w'||  
|list of found regexes, in all lines |findall|emails_lisr = re.findall(r'[\w\.-]+@[\w\.-]+', str)|
|named group|?P<name>regex| pattern = re.compile(r"(?P<first>\w+) (?P<second>\w+)")
|dictionary with results |groupdict|dicta=pattern.search("Hello⇢world").groupdict()|
|dictionary|groupdict returns |{'first': 'Hello', 'second': 'world'}|

###Basic regex Patterns
    a, X, 9, < -- ordinary characters just match themselves exactly. The meta-characters which do not match themselves because they have special meanings are: . ^ $ * + ? { [ ] \ | ( ) (details below)
    . (a period) -- matches any single character except newline '\n'
    \w -- (lowercase w) matches a "word" character: a letter or digit or underbar [a-zA-Z0-9_]. Note that although "word" is the mnemonic for this, it only matches a single word char, not a whole word. \W (upper case W) matches any non-word character.
    \b -- boundary between word and non-word
    \s -- (lowercase s) matches a single whitespace character -- space, newline, return, tab, form [ \n\r\t\f]. \S (upper case S) matches any non-whitespace character.
    \t, \n, \r -- tab, newline, return
    \d -- decimal digit [0-9] (some older regex utilities do not support but \d, but they all support \w and \s)
    ^ = start, $ = end -- match the start or end of the string
    \ -- inhibit the "specialness" of a character. So, for example, use \. to match a period or \\ to match a slash. If you are unsure if a character has special meaning, such as '@', you can put a slash in front of it, \@, to make sure it is treated just as a character. 

|boundry| matchers |
|---|---|
|^| begin line|
|$| end line|
|\b| word boundy|
|\B| not a word boundry|
|\A| input begin|
|\Z| input end|



        print 'found--->', match.group() ## 'found word:cat'

###Greedy Repetition. + and * specify largest repetition in the pattern
finding leftmost and largest matching(greedy)
    + -- 1 or more occurrences of the pattern to its left, e.g. 'i+' = one or more i's
    * -- 0 or more occurrences of the pattern to its left
    ? -- match 0 or 1 occurrences of the pattern to its left 


###Set of chars:Square Brackets

Square brackets indicate a set of chars, so [abc] matches 'a' or 'b' or 'c'. The codes \w, \s etc. work inside square brackets too with the one exception that dot (.) just means a literal dot. For the emails problem, the square brackets are an easy way to add '.' and '-' to the set of chars which can appear around the @ with the pattern r'[\w.-]+@[\w.-]+' to get the whole email address:

```python
  match = re.search(r'[\w.-]+@[\w.-]+', str)
  if match:
    print match.group()  ## 'alice-b@google.com'
```
(More square-bracket features) You can also use a dash to indicate a range, so [a-z] matches all lowercase letters. To use a dash without indicating a range, put the dash last, e.g. [abc-]. An up-hat (^) at the start of a square-bracket set inverts it, so [^ab] means any char except 'a' or 'b'. 


Group Extraction

The "group" feature of a regular expression allows you to pick out parts of the matching text. Suppose for the emails problem that we want to extract the username and host separately. To do this, add parenthesis ( ) around the username and host in the pattern, like this: r'([\w.-]+)@([\w.-]+)'. In this case, the parenthesis do not change what the pattern will match, instead they establish logical "groups" inside of the match text. On a successful search, match.group(1) is the match text corresponding to the 1st left parenthesis, and match.group(2) is the text corresponding to the 2nd left parenthesis. The plain match.group() is still the whole match text as usual.
```python
  str = 'purple alice-b@google.com monkey dishwasher'
  match = re.search('([\w.-]+)@([\w.-]+)', str)
  if match:
    print match.group()   ## 'alice-b@google.com' (the whole match)
    print match.group(1)  ## 'alice-b' (the username, group 1)
    print match.group(2)  ## 'google.com' (the host, group 2)
```
A common workflow with regular expressions is that you write a pattern for the thing you are looking for, adding parenthesis groups to extract the parts you want.

###RE Workflow and Debug

run RE on a small test text. print findall() result. If the pattern matches nothing, try weakening the pattern, removing parts of it so you get too many matches.
When it's matching nothing, you can't make any progress since there's nothing concrete to look at. 
Once it's matching too much, then you can work on tightening it up incrementally to hit expected.

###RE functions Options

Option flag added as to the search() or findall() etc.
```python
 re.search(pat, str, re.IGNORECASE).
```
    IGNORECASE -- ignore upper/lowercase differences for matching, so 'a' matches both 'a' and 'A'.
    DOTALL -- allow dot (.) to match newline -- normally it matches anything but newline. This can trip you up -- you think .* matches everything, but by default it does not go past the end of a line. Note that \s (whitespace) includes newlines, so if you want to match a run of whitespace that may include a newline, you can just use \s*
    MULTILINE -- Within a string made of many lines, allow ^ and $ to match the start and end of each line. Normally ^/$ would just match the start and end of the whole string. 

###RE non greedy, stop search as soon match is found
```python
tag_string= "<b>foo</b> and <i>so on</i>"
greedy_search=string(tag_string)
non_ready_search="<b>"
assert(re.search(r'(<.*>)',tag_string) == greedy_search)
assert(re.search(r'(<.*?>)',tag_string) == non_greedy_search)
```
The result is a little surprising, but the greedy aspect of the .* causes it to match the whole '<b>foo</b> and <i>so on</i>' as one big match. The problem is that the .* goes as far as is it can, instead of stopping at the first > (aka it is "greedy").

There is an extension to regular expression where you add a ? at the end, such as .*? or .+?, changing them to be non-greedy. Now they stop as soon as they can. So the pattern '(<.*?>)' will get just '<b>' as the first match, and '</b>' as the second match, and so on getting each <..> pair in turn. The style is typically that you use a .*?, and then immediately its right look for some concrete marker (> in this case) that forces the end of the .*? run.

? syntax is pcre i.e perl compatible re

###Substitution 

re.sub(pattern, replacement, str)  replaces all the instances of pattern str.
 The replacement string can include '\1', '\2' which refer to the text from group(1), group(2), and so on from the original matching text.

####email addresses sustitute, keep the user (\1) but change host to  yo-yo-dyne.com .

  str = 'purple alice@google.com, blah monkey bob@abc.com blah dishwasher'
  ## re.sub(pat, replacement, str) -- returns new string with all replacements,
  ## \1 is group(1), \2 group(2) in the replacement
  print re.sub(r'([\w\.-]+)@([\w\.-]+)', r'\1@yo-yo-dyne.com', str)
  ## purple alice@yo-yo-dyne.com, blah monkey bob@yo-yo-dyne.com blah dishwasher


### python RE excercise https://developers.google.com/edu/python/exercises/baby-names

##python test pakcages
`TODO`https://wiki.python.org/moin/UsingAssertionsEffectively


#Java
##ubuntu java setup
http://stackoverflow.com/questions/30116439/selected-directory-is-not-a-valid-home-for-jdk-intellij-idea-on-ubuntu
http://askubuntu.com/questions/130186/what-is-the-rationale-for-the-usr-directory where to install software in linux
##maven project

directory structure

```
.
+--_lib
+--_src
| +--_main
|    +--_java
|       +--src1.java
|       +--src2.java 
+--_target
|   +--_classes
|   +--_dependency
|   +--_...
|   +--out.jar 
```

##threadsafe


|threadsafe in java||
|---|---|
|`TBD`thread|||
|`TBD` atomic variable |java.util.concurrent.atomic AtomicLong||
|intrinsic reentrant lock |synchronized|public synchronized void service(){}|
|stale  data | reader thread examines data, value can be out of date. Unless synchronization is  used|
|safety on reading 2*32 data|volatile long number|
|`todo`|https://samxiangyu.wordpress.com/2015/02/20/java-concurrency-guardedby/|
|`todo`|http://winterbe.com/posts/2015/04/30/java8-concurrency-tutorial-synchronized-locks-examples/|
|`todo`|https://dzone.com/articles/concurrency-hot-try-jcip|

###compound actions: operations that must be executed atomically in order to remain thread safe , like read modify write, check then act(initialize)

####wrong!!!!poor responsiveness can used only by one thread 
####synchronizing shortest possible code paths
```java
public synchronized void service(ServletRequest req,ServletResponse resp) {
	BigInteger i = extractFromRequest(req);
	if (i.equals(lastNumber))
		encodeIntoResponse(resp, lastFactors);
	else {
		BigInteger[] factors = factor(i);
		lastNumber = i;
		lastFactors = factors;
	encodeIntoResponse(resp, factors);
	}
}
```

####Intrinsic reentrant lock
```java
public class Widget {
		public synchronized void doSomething() {
		...
		}
}
public class LoggingWidget extends Widget {
		public synchronized void doSomething() {
			System.out.println(toString() + ": calling doSomething");
			super.doSomething();
		}
}
```
####volatile recomentded use for status flags threadsafe 
volatile boolean asleep;
...
while (!asleep)
countSomeSheep();

##java jdk error


openjdk 64-bit server vm warning insufficient space for shared memory file error
$df
tmpfs 102400 102312 88 100% /tmp
`change the size of the tmp file:`
$sudo mount -o remount,size=2G /tmp 
#networking layer2
==================
http://smallbiztrends.com/2013/09/osi-model-layer-networking.html

Layer 2 is the data link where data packets are encoded and decoded into bits. The MAC (Media Access Control) sub layer controls how a computer on the network gains access to the data and permission to transmit it and the LLC (Logical Link control) layer controls frame synchronization, flow control and error checking.
Layer 3 provides switching and routing technologies, creating logical paths, known as virtual circuits, for transmitting data from node to node. Routing and forwarding are functions of this layer, as well as addressing, internetworking, error handling, congestion control and packet sequencing.
To summarize:
Layer 2 Data Link: Responsible for physical addressing, error correction, and preparing the information for the media
Layer 3 Network: Responsible for logical addressing and routing IP, ICMP, ARP, RIP, IGRP, and routers
Pros and Cons of Layer 2 Vs Layer 3
Some advantages of Layer 2 include lower costs, only requires switching, no routing gear is necessary and offers very low latency. Layer 2 also has some significant disadvantages such as the lack of router hardware, leaving them susceptible to broadcast storm

Layer 2 networks also forward all traffic, especially ARP and DHCP broadcasts. Anything transmitted by one device is forwarded to all devices. When the network gets too large, the broadcast traffic begins to create congestion and decreases network efficiency.

Layer 3 devices, on the other hand, restrict broadcast traffic such as ARP and DHCP broadcasts to the local network. This reduces overall traffic levels by allowing administrators to divide networks into smaller parts and restrict broadcasts to only that sub-network.
This means there is a limit to the size of a layer 2 network. However, a properly configured layer 3 network with the correct knowledge and hardware can have infinite growth.
A Layer 3 switch is a high-performance device for network routing. A router works with IP addresses at layer 3 of the model. Layer 3 networks are built to run on on layer 2 networks.
In an IP layer 3 network, the IP portion of the datagram has to be read. This requires stripping off the datalink layer frame information. Once the protocol frame information is stripped, the IP datagram has to be reassembled. Once the IP datagram is reassembled, the hop count has to be decremented, the header checksum has to be recalculated, a lookup for routing must be made, and only then can the IP datagram be chopped back up and inserted into frames and transmitted to the next hop. All of this takes extra time.


Enter Newer Technologies Such as Metro Ethernet Work Using Multiprotocol Label Switching (MPLS)
Multiprotocol Label Switching is a mechanism in high-performance telecommunications networks which directs and carries data from one network node to the next. MPLS makes it easy to create “virtual links” between distant nodes. It can encapsulate packets of various network protocols.
MPLS operates at a layer that is generally considered to lie between traditional definitions of layer 2 (data link layer) and layer 3 (network layer), and thus is often referred to as a “layer 2.5″ protocol.
It was designed to provide a unified data-carrying service for both circuit-based clients and packet-switching clients which provide a datagram service model. It can be used to carry many different kinds of traffic, including IP packets, as well as native ATM, SONET, and Ethernet frames.
It also allows you to maintain controls on your end points using Layer 3 switching, so with the best of both worlds Metro Ethernet services can provide the speed between locations and allow network quality of service transparency desired by small businesses all with a smaller financial footprint.
Where you might normally use Layer 3 to manage traffic in ALL locations over internet connections… with the Metro Ethernet you can use Layer 3 only as needed at end points which saves you on equipment costs and IT support costs. And you gain speed.


OSI Layers
– 1: physical
– 2: data link (nbr-nbr, e.g., Ethernet)
– 3: network (create entire path, e.g., IP)
– 4 end-to-end (e.g., TCP, UDP)
– 5 and above: boring


But Ethernet does not scale. It can’t replace IP as
the Internet Protocol
– Flat addresses
– No hop count
– Missing additional protocols (such as neighbor
discovery)
– Perhaps missing features (such as fragmentation, error
messages, congestion feedback)

ATM: datagram, but fixed size packets (48bytes data, 5 bytes header)

If you can't send a broadcast frame to another machine, they're not on your local network, and you will instead send the entire packet to a router for forwarding. That's what a Virtual LAN (VLAN) does, in essence: It makes more networks.

Networking 101

Understanding IP Addresses
Understanding Subnets and CIDR
Subnets Realized (Including IPv6)
Networking 101: Understanding Layers On a switch, you can configure VLANs, and then assign a port to a VLAN. If host A is in VLAN 1, it can't talk to anyone in VLAN 2, just as if they lived on totally disconnected devices. Well, almost; if the bridge table is flooded and the switch is having trouble keeping up, all data will be flooded out every port. This has to happen in order for communication to continue in these situations. This needs to be pointed out because many people believe VLANs are a security mechanism. They are not even close. Anyone with half a clue about networks (or with the right cracking tool in their arsenal) can quickly overcome the VLAN broadcast segmentation. In fact, a switch will basically turn into a hub when it floods frames, spewing everyone's data to everyone else.

This is accomplished with 802.1q, which will tag the packets as they leave the first switch with a VLAN identifier.

kurose ross

Framing. Almost all link-layer protocols encapsulate each network-layer datagram
within a link-layer frame before transmission over the link. A frame consists
of a data field, in which the network-layer datagram is inserted, and a
number of header fields. The structure of the frame is specified by the link-layer
protocol. We’ll see several different frame formats when we examine specific
link-layer protocols in the second half of this chapter.
• Link access. Amedium access control (MAC) protocol specifies the rules by which
a frame is transmitted onto the link. For point-to-point links that have a single
sender at one end of the link and a single receiver at the other end of the link, the
MAC protocol is simple (or nonexistent)—the sender can send a frame whenever
the link is idle. The more interesting case is when multiple nodes share a single
broadcast link—the so-called multiple access problem. Here, the MAC protocol
serves to coordinate the frame transmissions of the many nodes.
• Reliable delivery. When a link-layer protocol provides reliable delivery service, it
guarantees to move each network-layer datagram across the link without error.
Recall that certain transport-layer protocols (such as TCP) also provide a reliable
delivery service. Similar to a transport-layer reliable delivery service, a link-layer
reliable delivery service can be achieved with acknowledgments and retransmissions
(see Section 3.4). A link-layer reliable delivery service is often used for links
that are prone to high error rates, such as a wireless link, with the goal of correcting
an error locally—on the link where the error occurs—rather than forcing an end-toend
retransmission of the data by a transport- or application-layer protocol. However,
link-layer reliable delivery can be considered an unnecessary overhead for low
bit-error links, including fiber, coax, and many twisted-pair copper links. For this
reason, many wired link-layer protocols do not provide a reliable delivery service


Error detection and correction. The link-layer hardware in a receiving node can
incorrectly decide that a bit in a frame is zero when it was transmitted as a one,
and vice versa. Such bit errors are introduced by signal attenuation and electromagnetic
noise. Because there is no need to forward a datagram that has an error,
many link-layer protocols provide a mechanism to detect such bit errors. This is
done by having the transmitting node include error-detection bits in the frame,
and having the receiving node perform an error check. Recall from Chapters 3
and 4 that the Internet’s transport layer and network layer also provide a limited
form of error detection—the Internet checksum. Error detection in the link layer
is usually more sophisticated and is implemented in hardware. Error correction
is similar to error detection, except that a receiver not only detects when bit
errors have occurred in the frame but also determines exactly where in the frame
the errors have occurred (and then corrects these errors).

network interface card (NIC).

5.2.1 Parity Checks
Perhaps the simplest form of error detection is the use of a single parity bit. Suppose
that the information to be sent, D in Figure 5.4, has d bits. In an even parity
scheme, the sender simply includes one additional bit and chooses its value such
that the total number of 1s in the d + 1 bits (the original information plus a parity
bit) is even. For odd parity schemes, the parity bit value is chosen such that there is
an odd number of 1s. Figure 5.4 illustrates an even parity scheme, with the single
parity bit being stored in a separate field.
Receiver operation is also simple with a single parity bit. The receiver need
only count the number of 1s in the received d + 1 bits. If an odd number of 1-
valued bits are found with an even parity scheme, the receiver knows that at least
one bit error has occurred. More precisely, it knows that some odd number of bit
errors have occurred.
But what happens if an even number of bit errors occur? You should convince
yourself that this would result in an undetected error. If the probability of bit
errors is small and errors can be assumed to occur independently from one bit to
the next, the probability of multiple bit errors in a packet would be extremely small.

MAC broadcast address into the destination address field
of the frame. For LANs that use 6-byte addresses (such as Ethernet and 802.11),
the broadcast address is a string of 48 consecutive 1s (that is, FF-FF-FF-FF-FFFF
in hexadecimal notation

Students often wonder if ARP is a link-layer protocol or a network-layer protocol.
As we’ve seen, an ARP packet is encapsulated within a link-layer frame
and thus lies architecturally above the link layer. However, an ARP packet has
fields containing link-layer addresses and thus is arguably a link-layer protocol,
but it also contains network-layer addresses and thus is also arguably a networklayer
protocol. In the end, ARP is probably best considered a protocol that straddles
the boundary between the link and network layers

Preamble
Dest.
address
Source
address
Type
Data
CRC

Data field (46 to 1,500 bytes). This field carries the IP datagram. The maximum
transmission unit (MTU) of Ethernet is 1,500 bytes. This means that if the IP
datagram exceeds 1,500 bytes, then the host has to fragment the datagram, as discussed
in Section 4.4.1. The minimum size of the data field is 46 bytes. This
means that if the IP datagram is less than 46 bytes, the data field has to be
“stuffed” to fill it out to 46 bytes. When stuffing is used, the data passed to the
network layer contains the stuffing as well as an IP datagram. The network layer
uses the length field in the IP datagram header to remove the stuffing.

type field 2 bytes
the ARP protocol (discussed in the previous section) has its own type
number, and if the arriving frame contains an ARP packet (i.e., has a type field
of 0806 hexadecimal), the ARP packet will be demultiplexed up to the ARP protocol.
Note that the type field is analogous to the protocol field in the networklayer
datagram and the port-number fields in the transport-layer segment; all of
these fields serve to glue a protocol at one layer to a protocol at the layer above.

Cyclic redundancy check (CRC) (4 bytes). As discussed in Section 5.2.3, the purpose
of the CRC field is to allow the receiving adapter, adapter B, to detect bit
errors in the frame.

Preamble (8 bytes). The Ethernet frame begins with an 8-byte preamble field.
Each of the first 7 bytes of the preamble has a value of 10101010; the last byte is
10101011. The first 7 bytes of the preamble serve to “wake up” the receiving
adapters and to synchronize their clocks to that of the sender’s clock. Why
should the clocks be out of synchronization? Keep in mind that adapter A aims
to transmit the frame at 10 Mbps, 100 Mbps, or 1 Gbps, depending on the type
of Ethernet LAN. However, because nothing is absolutely perfect, adapter A will
not transmit the frame at exactly the target rate; there will always be some drift
from the target rate, a drift which is not known a priori by the other adapters on
the LAN. A receiving adapter can lock onto adapter A’s clock simply by locking
onto the bits in the first 7 bytes of the preamble. The last 2 bits of the eighth byte
of the preamble (the first two consecutive 1s) alert adapter B that the “important
stuff” is about to come.


switch Forwarding and Filtering


Tag Protocol Identifier (TPID) field (with a fixed hexadecimal value of 81-00), a
2-byte Tag Control Information field that contains a 12-bit VLAN identifier field,
and a 3-bit priority field that is similar in intent to the IP datagram TOS field.
In this discussion, we’ve only briefly touched on VLANs and have focused
on port-based VLANs. We should also mention that VLANs can be defined in
several other ways. In MAC-based VLANs, the network manager specifies the
set of MAC addresses that belong to each VLAN; whenever a device attaches to
a port, the port is connected into the appropriate VLAN based on the MAC
address of the device. VLANs can also be defined based on network-layer protocols
(e.g., IPv4, IPv6, or Appletalk) and other criteria. See the 802.1Q standard
[IEEE 802.1q 2005] for more details.

day in a life of HTTP

When Bob first connects his laptop to the network, he can’t do anything (e.g.,
download a Web page) without an IP address. Thus, the first network-related action
taken by Bob’s laptop is to run the DHCP protocol to obtain an IP address, as well
as other information, from the local DHCP server:
1. The operating system on Bob’s laptop creates a DHCP request message (Section
4.4.2) and puts this message within a UDP segment (Section 3.3) with
destination port 67 (DHCP server) and source port 68 (DHCP client). The UDP
segment is then placed within an IP datagram (Section 4.4.1) with a broadcast

IP destination address (255.255.255.255) and a source IP address of 0.0.0.0,
since Bob’s laptop doesn’t yet have an IP address.
2. The IP datagram containing the DHCP request message is then placed within
an Ethernet frame (Section 5.4.2). The Ethernet frame has a destination MAC
addresses of FF:FF:FF:FF:FF:FF so that the frame will be broadcast to all
devices connected to the switch (hopefully including a DHCP server); the
frame’s source MAC address is that of Bob’s laptop, 00:16:D3:23:68:8A.
3. The broadcast Ethernet frame containing the DHCP request is the first frame
sent by Bob’s laptop to the Ethernet switch. The switch broadcasts the incoming
frame on all outgoing ports, including the port connected to the router.
4. The router receives the broadcast Ethernet frame containing the DHCP request
on its interface with MAC address 00:22:6B:45:1F:1B and the IP datagram is
extracted from the Ethernet frame. The datagram’s broadcast IP destination
address indicates that this IP datagram should be processed by upper layer protocols
at this node, so the datagram’s payload (a UDP segment) is thus demultiplexed
(Section 3.2) up to UDP, and the DHCP request message is extracted
from the UDP segment. The DHCP server now has the DHCP request message.
5. Let’s suppose that the DHCP server running within the router can allocate IP
addresses in the CIDR (Section 4.4.2) block 68.85.2.0/24. In this example, all
IP addresses used within the school are thus within Comcast’s address block.



Let’s suppose the DHCP server allocates address 68.85.2.101 to Bob’s laptop.
The DHCP server creates a DHCPACK message (Section 4.4.2) containing
this IP address, as well as the IP address of the DNS server (68.87.71.226), the
IP address for the default gateway router (68.85.2.1), and the subnet block
(68.85.2.0/24) (equivalently, the “network mask”). The DHCP message is put
inside a UDP segment, which is put inside an IP datagram, which is put inside
an Ethernet frame. The Ethernet frame has a source MAC address of the
router’s interface to the home network (00:22:6B:45:1F:1B) and a destination
MAC address of Bob’s laptop (00:16:D3:23:68:8A).


The Ethernet frame containing the DHCP ACK is sent (unicast) by the router
to the switch. Because the switch is self-learning (Section 5.4.3) and previously
received an Ethernet frame (containing the DHCP request) from Bob’s
laptop, the switch knows to forward a frame addressed to 00:16:D3:23:68:8A
only to the output port leading to Bob’s laptop.
7. Bob’s laptop receives the Ethernet frame containing the DHCP ACK, extracts
the IP datagram from the Ethernet frame, extracts the UDP segment from the
IP datagram, and extracts the DHCP ACK message from the UDP segment.
Bob’s DHCP client then records its IP address and the IP address of its DNS
server. It also installs the address of the default gateway into its IP forwarding
table (Section 4.1). Bob’s laptop will send all datagrams with destination
address outside of its subnet 68.85.2.0/24 to the default gateway. At this point,
Bob’s laptop has initialized its networking components and is ready to begin
processing the Web page fetch. (Note that only the last two DHCP steps of the
four presented in Chapter 4 are actually necessary.)

laptop
will need to use the ARP protocol (Section 5.4.1).
10. Bob’s laptop creates an ARP query message with a target IP address of
68.85.2.1 (the default gateway), places the ARP message within an Ethernet
frame with a broadcast destination address (FF:FF:FF:FF:FF:FF) and sends the
Ethernet frame to the switch, which delivers the frame to all connected
devices, including the gateway router.
11. The gateway router receives the frame containing the ARP query message on the
interface to the school network, and finds that the target IP address of 68.85.2.1 in
the ARP message matches the IP address of its interface. The gateway router thus
prepares an ARPreply, indicating that its MAC address of 00:22:6B:45:1F:1B
corresponds to IP address 68.85.2.1. It places the ARP reply message in an
Ethernet frame, with a destination address of 00:16:D3:23:68:8A (Bob’s laptop)
and sends the frame to the switch, which delivers the frame to Bob’s laptop.

Bob’s laptop receives the frame containing the ARP reply message and extracts
the MAC address of the gateway router (00:22:6B:45:1F:1B) from the ARP
reply message.
13. Bob’s laptop can now ( finally!) address the Ethernet frame containing the DNS
query to the gateway router’s MAC address. Note that the IP datagram in this frame
has an IP destination address of 68.87.71.226 (the DNS server), while the frame has
a destination address of 00:22:6B:45:1F:1B (the gateway router). Bob’s laptop
sends this frame to the switch, which delivers the frame to the gateway router.


networking http://webapps.cse.unsw.edu.au/webcms2/course/index.php?cid=2373

#markdown
|link||
|---|---|
|guide|https://guides.github.com/features/mastering-markdown/|
|cheatsheet|https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet  |
|editor cpp qt|https://github.com/sd2017/CuteMarkEd  |
|editor build instructions|https://github.com/cloose/CuteMarkEd/wiki/Build-Instructions|
|commercial editor|http://askubuntu.com/questions/172698/how-do-i-install-sublime-text-2-3|
|run python from md snippets|https://pypi.python.org/pypi/Pweave|
|editor github like |https://github.com/voldyman/MarkMyWords|
|editor|https://github.com/retext-project/retext|
|list|https://www.maketecheasier.com/markdown-editors-linux/|
|list|http://mashable.com/2013/06/24/markdown-tools/#nbtn9HlaZkqL|

`TODO` http://mpastell.com/pweave/usage.html http://mpastell.com/pweave/usage.html http://iaingallagher.tumblr.com/post/41359279059/python-pweave-and-pandoc-howto

# H1
## H2
### H3
#### H4
##### H5
###### H6

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2
------
Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

1. First ordered list item
2. Another item
⋅⋅* Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
⋅⋅1. Ordered sub-list
4. And another item.

⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

* Unordered list can use asterisks
- Or minuses
+ Or pluses

tables
Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

quote >

http://stackoverflow.com/questions/23989232/is-there-a-way-to-represent-a-directory-tree-in-a-github-readme-md

http://stackoverflow.com/questions/28508141/code-block-inside-table-row-in-markdown


#epub
https://www.linuxbabe.com/desktop-linux/4-epub-reader-to-view-epub-files-on-ubuntu-16-0414-04
sudo apt-get install fbreader
sudo apt-get install okular okular-extra-backends

#database
https://github.com/Apress/relational-db-programming
##postgres 
https://help.ubuntu.com/community/PostgreSQL

##mysql
pro docker p41
###mysql cli
|action|commad|
|---|---|
|starting mysql cli|$mysql|
|setting database to use |mysql> use mysqldb|
|creating table|mysql> CREATE TABLE Catalog(CatalogId INTEGER PRIMARY KEY,Journal VARCHAR(25),Publisher VARCHAR(25),Edition VARCHAR(25),Title VARCHAR(45),Author VARCHAR(25));|
|insert data to table|INSERT INTO Catalog VALUES('1','Oracle Magazine','Oracle Publishing','November December 2013','Engineering as a Service','David A. Kelly');|
|querying table for all the data|mysql> SELECT * FROM Catalog;|
|list databases|mysql> show databases;|
|list tables|mysql> show tables;|

##hbase
|action|command|
|---|---|
|starting habase shell|/usr/bin/hbase shell |
|create table 'wlslog' with column family ‘log’|hbase(main):001:0> create 'wlslog' , 'log'|
|list tables|list| 
|get data in a row or a column cell|get 'wlslog', 'log7'|
|get data from a table |scan 'wlslog'|

###get data in a row
|$|hbase(main):045:0> get 'wlslog', 'log7'|
|---|---|
|COLUMN         |                                     CELL|                                                                                                                                                
| log:category   |                                    timestamp=1477934529221, value=Notice|                                                                                                               
| log:code        |                                   timestamp=1477934529300, value=BEA-000360|                                                                                                           
| log:msg          |                                  timestamp=1477934529327, value=Server started in RUNNING mode|                                                                                       
| log:servername       |                              timestamp=1477934529275, value=AdminServer|                                                                                                          
| log:time_stamp        |                             timestamp=1477934529193, value=Apr-8-2014-7:06:22-PM-PDT|                                                                                            
| log:type               |                            timestamp=1477934529248, value=WeblogicServer|          

###get single row data as dictionary 

|$|hbase(main):048:0> get  'wlslog', 'log5', {COLUMNS=>['log:msg']} |
|---|---|
|COLUMN|                                              CELL|                                                                                                                                                
| log:msg|                                            timestamp=1477934529012, value=Started Weblogic AdminServer|  


##couchdb
http://www.ibm.com/developerworks/library/os-couchdb/
https://www.tutorialspoint.com/couchdb/couchdb_introduction.htm
http://www.ibm.com/developerworks/library/wa-docker-polyglot-programmers/index.html

##elasticsearch http://www.ibm.com/developerworks/opensource/library/j-use-elasticsearch-java-apps/index.html

##books
https://github.com/Apress/next-generation-dbs
https://github.com/Apress/python-data-analytics

#javascript
https://github.com/Apress/pro-grunt.js
https://github.com/Apress/pro-react

#books code examples
https://github.com/Apress/
https://github.com/Apress/design-concepts-w-code
https://github.com/Apress/practical-api-design

##big data
https://github.com/Apress/big-data-made-easy
https://github.com/izenecloud/big-data-made-easy
https://github.com/onurakpolat/awesome-bigdata

#java
https://github.com/Apress/java-8-recipes
#cpp
https://github.com/Apress/cpp-recipes
https://github.com/Apress/cpp-standard-library-quick-reference/tree/master/Chapter%207  threads

#redis
https://github.com/JamzyWang/awesome-redis
https://github.com/rediscookbook/rediscookbook
https://github.com/josiahcarlson/redis-in-action