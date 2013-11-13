# Dynamic multi-threaded analysis of Ruby code

There are 3 types of errors when writing multi-threaded code (I need to
clean this up so that the definitions are clearer):
1.  Race conditions:  When a variable is shared between threads and
    there is a possibility of reading/writing to the variable in a
non-serial way.
2.  Dead locks: When one thread tries to hold locks 1 and 2 while a
    second thread tries to hold locks 2 and 1.
3.  Atomicity violations: I need to find a friendly definition of this.

Can we use Ruby 2.0 TracePoint API to examine program executions to find
these errors?

