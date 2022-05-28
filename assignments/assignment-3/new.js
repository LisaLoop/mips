let totalSum = 0;
let oddSum = 0;
let evenSum = 0;
const printSumOfRange = (start, end) => {
        let counter = start;
        while(counter < end){
                totalSum += counter;
                if(counter % 2 == 0){
                        evenSum += counter;
                } else {
                        oddSum += counter;
                }
                counter++; 
        }
        return {totalSum, evenSum, oddSum}
}
console.log(printSumOfRange(1,101));

// = 111111000000000000011111100000000000000000111110
//   000000000000000000000000000000000000000000000001

// even - last bit 0 - all zero
// all other bits 0



