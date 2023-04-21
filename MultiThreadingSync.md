# Synchronization
 Synchronized is the modifier applicable only methods and blocks but not for classes and varibles.
 If multiple thread are trying to operate on the same java obj then there may be chance of data inconsistance problem. 
 To overcome this problem, we should go for Synchonized keyword. If a method or block declared as Synchonized then at a time only one thread execute that method or block on the given the object.
 so that data inconsistance problem will be resolved.
 
 The main advantage of Synchonized keyword is we can resolve data inconsistance prolem. But main disadvantage Synchonized keyword is, it increases waiting time of thread and creates performace problem.
 
 Internally Synchronization concept is implmented by using locking. Every obj in java has unique loack. Whenever we using Synchronized keyword then only the locked concept come into the picture.
 If a thread wants to execute Synchronized method on the given object. first it has to get lock of that object. Once thread got the lock then it is allowed to execute any Synchronized method on that object.
 Once methods execution completes, automcatically thread releases the lock and acquiring/release the locks are managed by JVM.
 
 
