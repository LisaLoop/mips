const bubbleSort = (array) => {
        for(let i=0; i< array.length-1; i+=1){
                for(let j=i+1; j< array.length; j+=1){
                        const value1 = array[i];
                        const value2 = array[j];
                        if(value1 > value2){
                                array[i] = value2;
                                array[j] = value1;
                        }
                }
        }
}
// 1 2 3 4 6
const array = [3,4,2,1,6];

// copies 
// 0x000fff01
const RAM = new Array(40000);
const copy = (address1, address2) => {
        let byte = -1;
        while(byte != '\n'){
                byte = RAM[address1];
                RAM[address2] = byte;
                address1 += 1;
                address2 += 1;

        }
}
