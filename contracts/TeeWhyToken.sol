// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract TeeWhyToken {
    struct tokenDetails {
        string token_name;
        string token_symbol;
        uint256 token_balance;
        uint256 initial_balance;
    }

    mapping(address account => uint256) private balances;

    mapping(address account => mapping(address spender => uint256))
        private allowances;

    uint256 private totalTeeWhySupply;

    string private token_name;
    string private token_symbol;

    tokenDetails public token_details;
    address token_owner;

    event tokenMinted(address, address, uint256);

    constructor(string memory _token_name, string memory _token_symbol) {
        token_details.token_name = _token_name;
        token_details.token_symbol = _token_symbol;

        token_name = _token_name;
        token_symbol = _token_symbol;

        token_owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == token_owner,
            "Only the contract owner can do this"
        );
        _;
    }

    function tokenInfo()
        public
        view
        returns (string memory, string memory, uint256, uint256)
    {
        return (
            token_details.token_name,
            token_details.token_symbol,
            token_details.token_balance,
            token_details.initial_balance
        );
    }

    function tokenName() public view virtual returns (string memory) {
        return token_name;
    }

    function tokenSymbol() public view virtual returns (string memory) {
        return token_symbol;
    }

    function mintTeeWhyToken(
        address contractAddress,
        uint256 amountToMint
    ) internal {
        require(contractAddress != address(0), "Only Contract Owner Can Mint");
        updateAddressBalance(address(0), contractAddress, amountToMint);
    }

    function updateAddressBalance(
        address from,
        address to,
        uint256 value
    ) internal virtual {
        if (from == address(0)) {
            totalTeeWhySupply += value;
        } else {
            //This means we're transfering to another address
            uint256 balanceOfFromAddress = balances[from];
            if (balanceOfFromAddress < value) {
                revert("Low balance from sender.");
            }
            //This means
            balances[from] = balanceOfFromAddress - value;
        }

        if (to == address(0)) {
            //This means burning
            totalTeeWhySupply -= value;
        } else {
            //This means
            balances[to] += value;
        }

        emit tokenMinted(from, to, value);
    }

    function totalTokenSupply() public view virtual returns (uint256) {
        return totalTeeWhySupply;
    }

    function teeWhyTokenBalanceOfAnyAddress(
        address account
    ) public view virtual returns (uint256) {
        return balances[account];
    }

    function burnTeeWhyToken(address yourAddress, uint256 value) internal {
        require(yourAddress != address(0), "Can't burn Address Zero tokens");
        updateAddressBalance(yourAddress, address(0), value);
    }
}
