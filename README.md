# VTIL-Kaitai
Generates deserializers for the VTIL file format using Kaitai.

## Usage
Make sure your language is supported by checking out the `langs/` folder. If it's there copy and paste all files in that subfolder into your project. For more information please refer to Kaitai's [official documentation](https://kaitai.io/#quick-start).

## Example
You can find an example that dumps all instructions from a VTIL file [here](example/example.py). Here's a short outline of how to access the VTIL information:

```py
from vtil import Vtil

vtil = Vtil.from_file("./patch/to/file.vtil")
entrypoint = vtil.entrypoint.entry_vip
print(f"===> Entrypoint: {entrypoint}")
```

## Building
You can build the source files by executing one of the scripts.

```sh
# Windows
.\compile.bat
# Any other OS
./compile
```

This will update all source files in the `langs/` folder.
