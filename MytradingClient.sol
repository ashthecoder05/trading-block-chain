pragma solidity >=0.7.0 <0.9.0;

contract MytradingClient {
    
    uint256 public _clientidentity;
    //Client[] public client;
    Trader[] public trader;
    Inquiry[] public inquiry;
    Quotation[] public quotation;
    Salesorder[] public salesoreder;
    mapping(uint => Client) public client ;  
    
    struct  Inquiry {
        uint _InquiryNo;
        string _Inquiryproduct;
        uint _quantity;
        uint _clientid;
    }
    
    struct Quotation {
        uint _quotationNo;
        string _quotedproduct;
        uint _quantity;
        uint _quotedprice;
        uint  _InquiryNo;
        uint _clientid;
    }
        
        
    struct Salesorder{
        uint _SalesorederNo;
        string _productname;
        uint _productquantity;
        uint _date;
        uint _productprice;
        uint _deliverydate;
        uint _clientid;
    }
    
    
    struct Client {
        uint _clientid;
        string _firstname;
        string _lastname;
        int256 _quantity;
        string _curr;
        int256 _amount;
        int256 _date;
        string _tradercompanyname;
    }
    
    struct  Trader{
        uint _traderid;
        string _tradercompanyname;
        string _tradername; 
        uint _clientid;
    }


       function addInquiry(uint _InquiryNo , string memory  _Inquiryproduct , uint _quantity , uint _clientid ) public{
            inquiry.push(Inquiry(_InquiryNo,_Inquiryproduct,_quantity,_clientid));    }

    function addQuotation(uint _quotationNo , string memory  _quotedproduct , uint _productquantity, string memory  _tradername , uint _clientid ) public{
            trader.push(Quotation(_traderid,_tradercompanyname,_tradername,_clientid));    }
    
    
    function addtrader(uint _traderid , string memory  _tradercompanyname , string memory  _tradername , uint _clientid ) public{
            trader.push(Trader(_traderid,_tradercompanyname,_tradername,_clientid));    
    }
    
    function addclient( uint _clientid , string memory _firstname , string memory _lastname , int256 _quantity, string memory _curr, int256 _amount, int256 _date , string memory _tradercompanyname)public {
              _clientidentity = _clientid;
       client[_clientidentity] = Client(_clientid, _firstname , _lastname, _quantity, _curr, _amount, _date , _tradercompanyname); 
       //client.push (Client(_clientid , _firstname ,_lastname, _quantity,_curr ,_amount,_date, _tradercompanyname));
     }    
}