#docker
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
|`docker run -itd` --name=maven  maven:3.3.9-jdk-7  /bin/bash | starting pseudo terminal named container, with image and bash command |
|`docker run -itd --link` server3 --name=client3 client_img /bin/bash |run with ****link****|
| `docker ps` / `docker ps -a`| docker list running/stopped containers |
| `docker run -d -name1 wev1 -p` 8081:80|  ****exposing host:guest port****|
|`docker-compose up` | building and running composed docker containers with services|

|`docker images`| list docker images||||
|---|---|---|---|
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
|git pull --rebase `TBD`||
|---|---|



#linux commandline

|linux|commands|
|---|---|
|echo '123:456'!  cut -d: -f1 |     -string coloumns|
| http://unix.stackexchange.com/questions/81349/how-do-i-use-find-when-the-filename-contains-spaces ||
| http://www.linuxjournal.com/article/7385   | brackets braces substitution|
|wget  -nH --cut-dirs=1  -np http://higheredbcs.wiley.com/legacy/college/goodrich/1118290275/dsap/ch0{1,2,3,4,5,6,7,8,9}.zip  |wget removing top site dirs,    get 9 files , 9 inputs to command|
 |exec "$0" "$@"' |  run the script instead of command|
  |  http://superuser.com/questions/878967/what-do-these-parameters-do  |
  |http://askubuntu.com/questions/368509/why-is-0-set-to-bash                                         |
  |   unzip 	  ch0{1,2,3,4,5,6,7,8,9}.zip   | not working because they stuff all the files onto the same command line. While that works with most programs, unzip will take the first argument as the zip file, and any after the first as files to extract from it. You need to execute the command once for each file:|
|nproc|number of processprs|
|lscpu|info on cpu|
  |find . -name "*.zip" -print0 ! xargs -0 -n1 unzip|`TBD`|
|find . -name '*.zip' -exec unzip {} \;|`TBD`|
|useradd user||
|userdel user||


#pythonic

##list comperhention

```python
 new_list = ["something with " + ITEM for ITEM in iterable if condition_based_on(ITEM)]
```

```python
new_list = []
 for ITEM in iterable:
    if condition_based_on(ITEM):
        new_list.append("something with " + ITEM)
```

###list comprehention example:finding words in list that contains only specific letters.
```python
wordlist = ['mississippi','miss','lake','que']
letters = set('aqk')
list=[]
list=[word in wordlist if letters & set(word) ]
```
###withouth list comprehention example:finding words in list that contains only specific letters.
```python
wordlist = ['mississippi','miss','lake','que']
letters = set('aqk')
for word in wordlist:
    if letters & set(word):
        print word
```

##python details

all python methods are virtual
python multithread daemon threads, threads  exit when parent thread exit
PYTHON CPU-bound threads have  horrible performance properties!!!
multiple pythons  process do have multipython interperter

##python multiprocessing
###Lock    MUTEX   acquire-- only one can acquire , release  

# with Critical section
```python
with x_lock:
  statements using x
...
#new block code...
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



## RLock   - rentrent lock  , can be reacuire by same thread , methods calling methods trying to acqire lock in same thread
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

• Semaphore   - counting lock , acquire - waits if counter is 0 - otherwise decrement  , release increment count
	use --- limithing number of threads doing operation , signaling
• BoundedSemaphore **TBD**

• Event   set() , wait()
```python
e = threading.Event()
e.isSet() # Return True if event set
e.set() # Set event
e.clear() # Clear event
e.wait() # Wait for event
# This can be used to have one or more
#threads wait for something to occur
# Setting an event will unblock all waiting
#threads simultaneously (if any)
```

• Common use : barriers, notification
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

• Using an event to signal "completion"
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
# Done
evt.set()
```
• Condition
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
# Do something with x
```
import subprocess
p = subprocess.Popen(['python','child.py'],
	stdin=subprocess.PIPE,
	stdout=subprocess.PIPE)

	p.stdin.write(data) # Send data to subprocess
p.stdout.read(size) # Read data from subprocess


python!!!! on CPU bound use multiprocessing.Process instead of Threading.Thread    windows launch is in __main__ !!!
Process do not share same data , do not need locks  , do join , daemon , terminate!
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

python -o
if __debug__

if __name__=="__main__":
empty  __init__.py  --->  from filepy import *




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

#unknown exception info
except:

            exc_type, exc_obj, exc_tb = sys.exc_info()
            logging.fatal("Error: exc_type[%s] exc_obj[%s]",exc_type,exc_obj)

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

```python
sqlite3 . connect
if is_new:sqlite3.executscript(schema)    
```

##atom

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


|package||
|---|---|
|autocomplete-plus||
|markdown-preview|ctrl-shift-m|
|git-plus|ctrl-shift-h `pull before push`|
