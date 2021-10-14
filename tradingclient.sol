pragma solidity >=0.4.22 <0.9.0;

contract tradingclient{
    
    uint256 public _clientidentity = 0;
    uint256 public _inquiryidentity= 0;
    uint256 public _quotationidentity = 0;
    uint256 public _salesorederidentity = 0;

    //Client[] public client;
    Trader[] public trader;
   // Inquiry[] public inquiry;
   // Quotation[] public quotation;
   // Salesorder[] public salesoreder;

    mapping(uint => Client) public client ;  
    mapping(uint => Inquiry) public inquiry ;
    mapping(uint => Quotation) public quotation ;
    mapping(uint => Salesorder) public salesoreder ;
    
    struct  Inquiry {
        uint _InquiryNo;
        string _Inquiryproduct;
        uint _quantity;
        uint _clientid; }
    
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
         string _tradercompanyname; }
    
     struct  Trader{
        uint   _traderid;
        string _tradercompanyname;
        string _tradername; 
        uint _clientid;}

event InquiryAdd(
        uint _InquiryNum,
        string _Inquiryproductna,
        uint _quantitykg,
        uint _clientidnum
);

  function addInquiry(uint _InquiryNo , string memory  _Inquiryproduct , uint _quantity , uint _clientid ) public{
            _inquiryidentity =  _InquiryNo;
             inquiry[_inquiryidentity] = Inquiry(_InquiryNo,_Inquiryproduct,_quantity,_clientid);
             emit InquiryAdd(_InquiryNo, _Inquiryproduct, _quantity, _clientid); }

   function addQuotation(uint _quotationNo , string memory  _quotedproduct , uint _quantity, uint _quotedprice , uint  _InquiryNo , uint _clientid ) public
    {                 _quotationidentity = _quotationNo ;
          quotation[_quotationidentity] = Quotation(_quotationNo,_quotedproduct,_quantity,_quotedprice,_InquiryNo,_clientid) ;
         }    
   
    function addSalesorder(uint _SalesorederNo , string memory _productname , uint _productquantity, uint _date , uint _productprice ,uint _deliverydate, uint _clientid ) public{
              _salesorederidentity = _SalesorederNo;
              salesoreder[_salesorederidentity] = Salesorder(_SalesorederNo, _productname, _productquantity, _date , _productprice, _deliverydate, _clientid);  }
            
 
  
    function addtrader(uint _traderid , string memory  _tradercompanyname , string memory  _tradername , uint _clientid ) public{
            trader.push(Trader(_traderid,_tradercompanyname,_tradername,_clientid));    
    }
    
    function addclient( uint _clientid , string memory _firstname , string memory _lastname , int256 _quantity, string memory _curr, int256 _amount, int256 _date , string memory _tradercompanyname)public {
              _clientidentity = _clientid;
       client[_clientidentity] = Client(_clientid, _firstname , _lastname, _quantity, _curr, _amount, _date , _tradercompanyname); }    
    
}