$t0 = age; 
if(age >= 18){
        console.log("you may enter the bar")
} else {
        console.log("you may not enter the bar)
} 

/////////

        $t0 = age;
        $t1 = age - 17;
        bgtz $t1 positive;

negative:
        send a negative message 
        jump to label end
positive: 
        send positive a message 
end:


/////////////////

for(let i = 0; i<= 10; i++){
        console.log(i);
}

        $t0 = 0;
        $t1 = 10;
        $t2 = $t1 - $t0;
        bgtz $t2 end; 
loop:
        print $t0;
        $t0 = $t0 + 1;
        $t2 = $t1 - $t0;
        blez $t2 loop;
end:

///////
// print 1 - 10, but if any number is 5 stop the program
for(let i = 0; i<= 10; i++){
        if(i == 5){
                break; 
        }
        console.log(i);
}

        $t0 = 0;
        $t1 = 10;
        $t2 = $t1 - $t0;
        bgtz $t2 end; 
loop:
        $t3 = 5 - $t0;
        beq $t3 0 end;
        print $t0;
        $t0 = $t0 + 1;
        $t2 = $t1 - $t0;
        blez $t2 loop;
end:


// print all numbers except for 5
for(let i = 0; i<= 10; i++){
        if(i == 5){
                continue; 
        }
        console.log(i);
}

        $t0 = 0;
        $t1 = 10;
        $t2 = $t1 - $t0;
        bgtz $t2 end; 
loop:
        $t3 = 5 - $t0;
        $t0 = $t0 + 1;
        beq $t3 0 loop;
        print $t0;
        $t2 = $t1 - $t0;
        blez $t2 loop;
end:

/////
// There are 2 functions. F1 prints the number zero. F2 calls F1 twice

        jump F2;
F1: 
        $t0 = 0;
        print $t0;
        jump $t2;       # return
F2: 
        $t2 = PC + 2;       # line 92 + 2
        jump F1;            #
        $t2 = PC + 2;       # line 94 + 2
        jump F1;            #
        nop;


///////////////////////////

// There are 2 functions. F1 prints the number zero. F2 calls F1 twice
const f1 = (value) => console.log(value);
const f2 = () => {
        f1(101);
        f1(102);
}

        jump F2;
F1: 
        pop $t0;
        print $t0;
        jump $t2;       # return
F2: 
        push 101;
        $t2 = PC + 2;       # line 115 + 2
        jump F1;   
        push 102;           #
        $t2 = PC + 2;       # line 118 + 2
        jump F1;            #
        nop;