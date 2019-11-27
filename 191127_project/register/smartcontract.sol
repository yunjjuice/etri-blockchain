pragma solidity ^0.4.18;

contract registerContract {

    uint8 numberOfAccounts; // 총 계정의 수
    address contractOwner;

    struct myStruct {
        string id;
        string pw;
        string email;
    }

    myStruct[] public accounts;
    
    event eventAccount(
        string id,
        string pw,
        string email
        );

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addAccStru (string _id, string _pw, string _email) public {
        bool flag = true; // 중복확인
        for (uint8 i = 0; i < numberOfAccounts; i++) {
            // 문자열 비교는 해쉬함수(sha3)를 통해서 할 수 있습니다.
            if(keccak256(accounts[i].id) == keccak256(_id)){
                flag = false; break;
            }
        }
        
        if(flag){
            accounts.push(myStruct(_id, _pw, _email)) -1;
            numberOfAccounts++;
            emit eventAccount(_id, _pw, _email);
        }
    }
        
    // 계정 개수를 리턴
    function getNumOfAccounts() public constant returns(uint8) {
        return numberOfAccounts;
    }

    // 번호에 해당하는 계정의 id 리턴
    function getAccountStruct(uint _index) public view returns (string, string, string) {
        return (accounts[_index].id, accounts[_index].pw, accounts[_index].email);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}