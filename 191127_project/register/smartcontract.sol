pragma solidity ^0.4.18;

contract registerContract {

    uint8 numberOfInfo; // 총 계정의 수
    address contractOwner;
    mapping (uint8 => string) accountList;

    struct myStruct {
        string id;
        string pw;
        string email;
    }

    myStruct[] public info;
    //string[] public accounts;

    event eventAccount(
        string id,
        string pw,
        string email,
        bool flag
        );

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addInfoStru (string _id, string _pw, string _email) public {
        bool flag = true; // 중복확인
        
        for (uint8 i = 0; i < numberOfInfo; i++) {
            // 문자열 비교는 해쉬함수(sha3)를 통해서 할 수 있습니다.
            if(keccak256(info[i].id) == keccak256(_id)){
                flag = false; break;
            }
        }
        
        if(flag){
            info.push(myStruct(_id, _pw, _email)) -1;
            numberOfInfo++;
        }
        emit eventAccount(_id, _pw, _email, flag);
        
    }
        
    // 계정 개수를 리턴
    function getNumOfAccounts() public constant returns(uint8) {
        return numberOfInfo;
    }

    // 번호에 해당하는 계정의 struct 리턴
    function getInfoStruct(uint8 _index) public view returns (string, string, string) {
        return (info[_index].id, info[_index].pw, info[_index].email);
    }
    
    // 번호에 해당하는 id만 리턴
    function getID(uint8 _index) public view returns (string){
        return (info[_index].id);
    }
    
    function insertAccount(string _id, string _acc) public{
        bool flag = false; // 중복확인
        uint8 index;
        
        for (uint8 i = 0; i < numberOfInfo; i++) {
            // 문자열 비교는 해쉬함수(sha3)를 통해서 할 수 있습니다.
            if(keccak256(info[i].id) == keccak256(_id)){
                flag = true; 
                index=i;
                break;
            }
        }
        
        if(flag){
            accountList[index] = _acc;
        }
    }
    
    // 번호에 해당하는 account만 리턴
    function getAccount(uint8 _index) public view returns (string){
        return accountList[_index];
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}