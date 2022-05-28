const printN = (i, n) => {
        if(i >= n){return }
        console.log(" ",i, " ");
        return printN(i+1, n)
}


// a recursive function that calculates triangle numbers
// n = number of rows
const triangleNumbers = (n) => {
   if(n === 1){return 1}
   return n + triangleNumbers(n-1);     
}


const triangle = (n) => {
        if(n <= 1){return 1}
        return n + triangleNumbers(n-1);     
     }
