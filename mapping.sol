// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
    
contract Mapping {
    //define a mapping to store values associated with address
    mapping(address => uint256) public valueMapping;

    //modifier to check if the value being set is not true
    modifier nonZeroValue(uint256 _value) {
        require(_value !=0, "Value cannot be zero");
        _;
    }
        //modifier to check if the value being set is not true
    modifier  valueHasBeenSet() {
        require(valueMapping[msg.sender] !=0, "No value Set for sender");
        _;
    }
    
    constructor() {
        valueMapping[msg.sender] = 100;
    }

    //function
    function setValue(uint256 _value) public nonZeroValue(_value) {
       // valueMapping[msg.sender] = _value;
        if(_value > valueMapping[msg.sender] ) {
            valueMapping[msg.sender] = _value;
        }
    }
    //function
    function getValue() public view valueHasBeenSet returns (uint256) {
        return valueMapping[msg.sender];
    }
}