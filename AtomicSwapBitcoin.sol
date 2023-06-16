pragma solidity ^0.8.18;

contract AtomicBitcoinSwap {
    address payable public recipient; // Bob's address  
    address payable public sender; // Alice's address

    bytes32 public hashedsecret;

    uint256 duration;

    // Initiates the cross-chain transfer.
    // Args: hashed secret, recipient addr, timeout duration.
    // Accepts tokens to be held in escrow.
    constructor(bytes32 _hashedsecret, address payable _recipient, uint256 _duration) payable {
        sender = payable(msg.sender);
        recipient = _recipient;

        hashedsecret = _hashedsecret;

        duration = _duration;

    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    function claimBalace() public {
        require(msg.sender == recipient, "Only the recipient can claim the balance");
        recipient.transfer(address(this).balance);
    }

}