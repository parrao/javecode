# InterThread Communication

Two thrad can communicate with each other by using wait(), Notify() and NotifyAll() mathods. The thread which is excepting updation is responsible to call wait method then immediately enter into waiting state.
The thread, which is resposbile to perform updation, after performing updation it is responsble to call nofity methods. Waiting thread will get that notification and continue its execution with those updated items.

Note:  wait(), Notify() and NotifyAll() is present in Object class but not in thread class. Because thread can call these methods on any java object.



