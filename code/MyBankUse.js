var Web3=require('web3');
var _abiBinJson = require('./MyBank.json');      //importing a javascript file

var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8345"));
contractName=Object.keys(_abiBinJson.contracts); // reading ['MyBank.sol:MyBank']
//console.log("- contract name: ", contractName); //or console.log(contractName[0]);
_abi=_abiBinJson.contracts[contractName].abi;
_abiArray=JSON.parse(JSON.stringify(_abi));
//_abiArray=JSON.parse(_abi);      //JSON parsing needed!!
//_bin=_abiBinJson.contracts[contractName].bin;
//console.log("- ABI: " + _abiArray);
//console.log("- Bytecode: " + _bin);

var myBank = new web3.eth.Contract(_abiArray,"0x5b256F19eABFCa5DdbA951f9171c3a1352D60499");

async function doIt() {
    const accounts = await web3.eth.getAccounts();
    console.log("Call from: " + accounts[0]);
    myBank.methods.getBalance().call().then(console.log);
    myBank.methods.deposit(1111).send({from:accounts[0],gas:80000,value:1111});
    myBank.methods.getBalance().call().then(console.log);
}

doIt()
