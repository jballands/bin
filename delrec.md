# delrec.sh

Use this script to recursively delete instances of a directory recursively. For example:

```
src
L node_modules
  L moduleB
    L node_modules
L dist
L packages
  L package1
  L package2
    L node_modules
	  L moduleA
	    L node_modules
```

Running this:

```sh
delrec.sh . node_modules
```

Would only select:

- `src/node_modules`
- `src/packages/package2/node_modules`

Because even though more `node_modules` exists underneath these, they will be deleted naturally by deleting the instance above them.
