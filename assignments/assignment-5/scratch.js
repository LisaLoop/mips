const fib = (n) => {
        if(n <= 1){return n}
        let a = fib(n-1);
        let b = fib(n-2);
        return a + b;
}