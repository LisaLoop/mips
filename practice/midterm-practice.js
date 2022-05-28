// # 
// # - make a 16 x 16 xor table
// # What is a xor table?
// # 
// #   1 2
// # 1 0 3 
// # 2 3 0

const makeXorTable = () => {
        let table = [];
        for(let row=0; row<16; row++){
                let line = [];
                for(let col=0; col<16; col++){
                        let xored = row^col;
                        // let hexa = xored.toString(16);
                        // line.push(hexa);
                        line.push(xored);
                }
                table.push(line);//.join('  ').toUpperCase());
        }
        console.table(table);
        return table;
}
// makeXorTable();


const makeAndTable = () => {
        let table = [];
        for(let row=0; row<16; row++){
                let line = [];
                for(let col=0; col<16; col++){
                        let anded = row&col;
                        // let hexa = xored.toString(16);
                        // line.push(hexa);
                        line.push(anded);
                }
                table.push(line);//.join('  ').toUpperCase());
        }
        console.table(table);
        return table;
}
// makeAndTable();

const makeOrTable = () => {
        let table = [];
        for(let row=0; row<16; row++){
                let line = [];
                for(let col=0; col<16; col++){
                        let ored = row|col;
                        // let hexa = xored.toString(16);
                        // line.push(hexa);
                        line.push(ored);
                }
                table.push(line);//.join('  ').toUpperCase());
        }
        console.table(table);
        return table;
}
// makeOrTable();

const makeNandTable = () => {
        let table = [];
        for(let row=0; row<16; row++){
                let line = [];
                for(let col=0; col<16; col++){
                        let naned = ~(row & col);
                        // let hexa = xored.toString(16);
                        // line.push(hexa);
                        line.push(naned);
                }
                table.push(line);//.join('  ').toUpperCase());
        }
        console.table(table);
        return table;

}
makeNandTable();