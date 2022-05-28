let RAM = new ArrayBuffer(64);
let MEM = new DataView(RAM);

let $sp	= RAM.byteLength;
let $fp = RAM.byteLength;
let $ra = 0;

let $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8 = 0;
let $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7, $s8 = 0;
let $a0, $a1, $a2 = 0;
let $v0, $v1 = 0;

const lw = (address) => MEM.getInt32(address, true);
const lb = (address) => MEM.getInt8(address, true);
const sw = (address, word) => MEM.setInt32(address, word, true);
const sb = (address, byte) => MEM.setInt8(address, byte, true);
const la = (address) => address;

// Source = "ABCDEFGHIJKL\n"
const SOURCE = 8;
const DISPLAY = 40;

const main = () => {
	// $a0 = la(SOURCE);
	// $a1 = la(DISPLAY);
	// copy();
	$sp -= 4;
	sw($sp, SOURCE);
	$sp -= 4;
	sw($sp, DISPLAY);
	
	frameCopy();
	printMemory(MEM);
};

// frameCopy (sourceAddr: word, destAddr: word)
// copies source to display using stack frames
const frameCopy = () => {
	// prolog
	$sp -= 4;
	sw($sp,$ra);
	// save the original frame pointer
	$sp -= 4;
	sw($sp, $fp);
	// save global variables
	// save local variables 
	$sp -= 8; // space for 2 local vars
	// frame pointer = stack pointer
	$fp = $sp;
	// body
	$t0 = lw($fp+20); // load source from stack 
	$t1 = lw($fp+16);
	console.log("t0: ", $t0);
	console.log("t1: ", $t1);
  do {
    $t2 = lb($t0);
		sb($t1, $t2);
		$t0 += 1;
		$t1 += 1;
	}
	while ($t2 !== 0);
  // epilog
}
const copy = () => {
	// copy source to display
	do {
		$t0 = lb($a0);
		sb($a1, $t0);
		$a0 += 1;
		$a1 += 1;
	}
	while ($t0 !== 0);
};


// --- Compiler stuff ---

const asciiz = (base, string) => {
	string.split("")
		.map(c => c.charCodeAt(0))
		.forEach((code, i) => sb(base + i, code));
	sb(base + string.length, 0);
};

const printMemory = (mem, start = 0, end = mem.byteLength) => {
  let str = "";
  for (let i = start; i < end; i += 1) {
    if (i % 4 === 0) { str += " " ; }
    if (i % 16 === 0) { str += "\n"; }
    str += mem.getInt8(i);
	}
  console.log(str);
};


// source .asciiz "ABCDEFGHI\n"
asciiz(SOURCE, "ABCDEFGHI\n");

main();
