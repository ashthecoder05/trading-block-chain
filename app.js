App = {
  loading: false,
  contracts: {},
  load: async() =>{
//to talk to block chain using web3 js    
    await App.loadWeb3()
    await App.loadAccount()
    await App.loadContract()
    await App.render()
   //await App.addInquiry()

  },
 // https://medium.com/metamask/https-medium-com-metamask-breaking-change-injecting-web3-7722797916a8
 loadWeb3: async () => {
 if (typeof web3 !== 'undefined') {
   App.web3Provider = web3.currentProvider
    web3 = new Web3(web3.currentProvider)
 } else {
    window.alert("Please connect to Metamask.")
  }
  // Modern dapp browsers...
  if (window.ethereum) {
    window.web3 = new Web3(ethereum)
    await window.ethereum.enable()
    try {
      // Request account access if needed
      const accounts = await ethereum.send(
        "eth_requestAccounts"
    );
          //await ethereum.enable()
      // Acccounts now exposed
      web3.eth.sendTransaction({/* ... */})
    } catch (error) {
      // User denied account access...
    }
  }
  // Legacy dapp browsers...
  else if (window.web3) {
    App.web3Provider = web3.currentProvider
    window.web3 = new Web3(web3.currentProvider)
    // Acccounts always exposed
    web3.eth.sendTransaction({/* ... */})
  }
  // Non-dapp browsers...
  else {
    console.log('Non-Ethereum browser detected. You should consider trying MetaMask!')
  }
},
loadAccount: async () => {
  // Set the current blockchain account
App.account = await web3.eth.getAccounts();
let address = await web3.eth.getAccounts();
//let accounts = await web3.eth.getAccounts();
web3.eth.defaultAccount = address[0]

//App.account = accounts[0]
  //App.account = web3.ethereum.accounts[0]
  //App.account =  eth.getaccounts()
  console.log(web3.eth.defaultAccount)
},
loadContract: async()=> {
// Create a JavaScript version of the smart contract
//const TruffleContract = require('truffle-contract'); 
const tradingclient = await $.getJSON('tradingclient.json')
App.contracts.tradingclient = TruffleContract(tradingclient)
App.contracts.tradingclient.setProvider(App.web3Provider)
App.tradingclient = await App.contracts.tradingclient.deployed()
},

render: async () => {
   // Prevent double render
   if (App.loading) {
    return
  }

  // Update app loading state
  App.setLoading(true)
  $('#account').html(App.account)

    // Render Tasks
  //  await App.renderTasks()

    // Update loading state
    App.setLoading(false)
},

addInquiry: async () => {
  App.setLoading(true)
  const inumber = $('#inumber').val()
  const iproductname = $('#iproductname').val()
  const iquantity = $('#iquantity').val()
  const iclient = $('#iclient').val()

//  console.log(inumber,iproductname,iquantity,iclient)
 // console.log("hello world")
 await App.tradingclient.addInquiry(inumber,iproductname,iquantity,iclient,{from: web3.eth.defaultAccount})
  window.location.reload()
},

addQuotation: async () => {
  App.setLoading(true)
  const Qnumber = $('#Qnumber').val()
  const qproductname = $('#qproductname').val()
  const qquantity = $('#qquantity').val()
  const qprice = $('#qprice').val()
  const qclient = $('#qclient').val()
  await App.tradingclient.addQuotation(Qnumber,qproductname,qquantity,qprice,qclient)
  //window.location.reload()
},


addSalesorder: async () => {
  App.setLoading(true)
  const Snumber = $('#Snumber').val()
  const sproductname = $('#sproductname').val()
  const squantity = $('#squantity').val()
  const sdate = $('#sdate').val()
  const sprice = $('#sprice').val()
  const ddate = $('#ddate').val()
  const sclient = $('#sclient').val()
  await App.tradingclient.addSalesorder( Snumber,sproductname,squantity,sdate,sprice,ddate,sclient)
  window.location.reload()
},


setLoading: (boolean) => {
  App.loading = boolean
  const loader = $('#loader')
  const content = $('#content')
  if (boolean) {
    loader.show()
    content.hide()
  } else {
    loader.hide()
    content.show()
  }
}
}

$(() =>{
 $(window).load(() => {
    App.load()
  })
})


