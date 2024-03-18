### StorageFactory contract

The `StorageFactory` contract is designed to deploy instances of another contract, `SimpleStorage`, which is intended to store a user's favorite number. 
The functionality to set a favorite number in a `SimpleStorage` contract is restricted. Only the creator of the `SimpleStorage` instance can set a new favorite number using the function `exStore(uint256)` in `StorageFactory` contract.

