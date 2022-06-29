// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 < 0.8.13;

contract Immutable {

    struct location {
        string city;
        uint pin;
    }
   
   struct user {
       string name;
       uint age;
        location location;
   }

   user[] public users;

    function addUser(string memory _name, uint _age, string memory _city, uint _pin ) public  {
        user memory new_user = user(_name, _age, location(_city, _pin));

        users.push(new_user);
    }

    function popUser() public{
        users.pop();
    }

    // UNABLE TO PUSH USERS TO NEW_USERS ARRAY
    function removeUser(string memory _name) public {
        user[] memory new_users;
        for(uint i = 0; i < users.length ; i++){
            if(keccak256(abi.encodePacked(users[i].name)) != keccak256(abi.encodePacked(_name))){
        user memory new_user = user(users[i].name, users[i].age, location(users[i].city, users[i].pin));
                new_users.push(new_user);
            }
        }
    }

    function getUsersLength() public view returns(uint){
        return users.length;
    }
    
}