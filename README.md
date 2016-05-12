# Cascade

> The **Cascade virus** is a prominent [computer virus][computer-virus] that was a resident written in [assembly][assembly], and it was widespread in the 1980s and early 1990s. It infected [.COM files][com-files] and had the effect of making text on the screen fall down and form a heap in the bottom of the screen. It was notable for using an [encryption][encryption] algorithm to avoid being detected. However one could see that infected files had their size increased by 1701 or 1704 bytes. In response, [IBM][ibm] developed its own anti-virus software.
>
> — Wikipedia, ["Cascade (computer virus)"][cascade-wiki]

## Disclaimer

#### This program and its source files are only uploaded for educational purposes. Do not execute this program if you do not know what it does.

## Requirements

- MASM 6.x
- x2b or exe2bin

## Files

```sh
cascade.asm    # source code for CASCADE virus; x86 assembly
cascade.com    # compiled, live virus
makehlv.bat    # Batch file to build virus
```

## Building

You can use **[MASM 6.11d][masm]** (16bit assembler) along with **X2B** (EXE -> COM
Converter) for building the virus. You also need DOS **[debug][dos-debug]**
executable for patching up the initial jump (automatically done by `makehlv.bat`). If you are using **[exe2bin][exe2bin]**, you have to modify `makehlv.bat` accordingly.

Once you have the environment setup, follow these steps:

1. Open `cascade.asm`. Find `DEMO EQU FALSE` (it should be near line no.
   13). If you make this `DEMO EQU TRUE`, the virus will not exhibit any
   harmful things. For our purpose, leave it at `DEMO EQU FALSE`.
2. Add `_DANGER EQU TRUE` after this line.
3. Execute the following command from the command-line to build the virus:

    ```
    makehlv cascade
    ```

## Credits

This source code and instructions was obtained from [Kannan's Blog](http://kannan.jumbledthoughts.com/index.php/cascade-virus-down-the-memory-lane/ "Cascade Virus: Down the memory lane.")

[computer-virus]: https://en.wikipedia.org/wiki/Computer_virus "Computer virus"
[assembly]: https://en.wikipedia.org/wiki/Assembly_language "Assembly"
[com-files]: https://en.wikipedia.org/wiki/COM_file "COM file"
[encryption]: https://en.wikipedia.org/wiki/Encryption "Encryption"
[ibm]: https://en.wikipedia.org/wiki/IBM "IBM"
[cascade-wiki]: https://en.wikipedia.org/wiki/Cascade_(computer_virus) "Cascade (computer virus)"
[masm]: https://www.google.com/search?q=masm+6.11+download "Google MASM 6.11 Download"
[dos-debug]: https://en.wikipedia.org/wiki/Debug_(command) "Debug (command)"
[exe2bin]: https://en.wikipedia.org/wiki/Exe2bin "exe2bin"
