pragma solidity ^0.4.18;

contract Counter {
    uint count;

    event Instructor(
       	uint count
    );

    function Counter(uint256 _count) public {
        count = _count;
    }

    function increment() public {
        count += 1;
        emit Instructor(count);  
    }
    
    function decrement() public {
        count -= 1;
        emit Instructor(count); 
    }

    function getCount() public view returns (uint256) {
        return count;
    }
    
    function setInstructor(uint _count) public {
       count = _count;
       emit Instructor(_count);        // Add this
   }
   
   function getInstructor() view public returns (uint) {
       return (count);
   }
}