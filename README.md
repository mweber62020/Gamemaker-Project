# LegendofGrumpy
Small Gamemaker game I'm working on.

# Linda Tuple Space Project (C++)


This project implements a distributed tuple space system in C++ based on the Linda model.
It allows multiple remote clients to write, read, and consume tuples over TCP.

- Tuple space operations:
  - `OUT` — store a tuple
  - `RD` — non-destructive read (blocks if no match)
  - `IN` — destructive read (removes tuple and blocks if no match)
- Tuples can contain: `int64_t`, `double`, and `string`.
- '?' can be used as a wildcard to match any value in a tuple.

---

### TupleSpace

- TupleSpace class stores all tuples in memory.
- Thread-safe using mutex.
- Compares tuples as strings. Wildcards are represented as string `?`.
- Serialization: Tuples are sent and received over TCP as comma-separated strings.

### Server

- Listens on TCP port 8080 for connections.
- Each client is handled in a separate thread.
- Accepts simple text-based commands such as:
  - OUT,Mark Weber,Student,21
  - RD,?,Student,21
  - IN,?,?,?
- Blocks clients for `RD`/`IN` until a matching tuple is available.

### Client

- Simple program to connect to the server.
- Reads commands and sends them to the server and prints the response.

---

## Instructions

- To run the test file:
  - First, run 'make clean' to remove any leftover files.
  - Then, run 'make' to compile the client and server.
  - Finally, run 'make test' to run the automated tests.

- To run the client and server yourself after compiling:
  - In one window run './server'
  - In another window run './client'
  - Now you can run commands such as OUT, RD, and IN.
