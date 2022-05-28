const array = [50, 53, 52, 49, 48, 51, 99, 45, 53, 47, 47, 50];

console.log(array[0]);
for(let i = 1; i < array.length-1; i+=1){
        const x = array[i-1];
        const y = array[i];
        const z = array[i+1];
        console.log(((x+y+z)/3) | 0); 
}
console.log(array[array.length-1]);