
const swap = (arr, headIndex, tailIndex) => {
        let temp =  arr[headIndex];
        arr[headIndex] = arr[tailIndex];
        arr[tailIndex] = temp;
        return arr
}
const bubbleSort = (array) => {
        for(let i = 0; i < array.length-1; i+=1){
                for(let j = i+1; j < array.length; j++){
                        if(array[j] < array[i]){
                                swap(array, i, j);        
                        }
                }
        
        }
}
const test = () => {
        console.log("example1");
        let intArray1 = [0,1,2,3];
        bubbleSort(intArray1);
        console.log("example2");
        let intArray2 = [4,5,3,2,1];
        bubbleSort(intArray2);
        console.log("example3");
        let intArray3 = [0, 1, -1, 0, 1, 0, 5, -5, 0];
        bubbleSort(intArray3);

}
test();
// const intArray = [0, 1];
/*
 1 , 5 , 2 , 0 ->  

 check each element in the array and compare it with the thing next to it
*/

