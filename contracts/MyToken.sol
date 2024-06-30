// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyToken {
    string public name = "MyToken"; // 聲明一個名為 MyToken 的智能合約。
    string public symbol = "MTK"; // 代幣的名稱
    uint8 public decimals = 18; // 代幣的小數位數，常用的 ERC20 代幣為18
    uint256 public totalSupply; // 代幣的總供應量

    mapping(address => uint256) public balanceOf; // 記錄每個地址的代幣余額。
    mapping(address => mapping(address => uint256)) public allowance; // 記錄一個地址授權另一個地址可以花費的金額

    // uint256 表示256位無符號整數

    event Transfer(address indexed from, address indexed to, uint256 value); // 定義轉賬事件，記錄從一個地址轉賬到另一個地址的金額。
    event Approval(address indexed owner, address indexed spender, uint256 value); // 定義授權事件，記錄一個地址授權另一個地址可以花費的金額。

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * 10 ** uint256(decimals); // 計算總供應量，將初始供應量乘以10的18次方（如果小數位數為18）。
        balanceOf[msg.sender] = totalSupply; // 將總供應量分配給合約的部署者。
    }

    // 轉帳函數
    // 將一定數量的代幣從調用者賬戶轉移到目標賬戶
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance."); // 確保調用者有足夠的餘額。
        balanceOf[msg.sender] -= _value; // 從調用者的余額中減去轉移的數量。
        balanceOf[_to] += _value; // 將轉移的數量添加到目標賬戶的余額中。
        emit Transfer(msg.sender, _to, _value); //  觸法轉帳事件
        return true;
    }

    // 授權函數
    // 授權_spender地址可以花費調用者賬戶中的一定數量的代幣。
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value; // 设置_spender可以花费的代币数量。
        emit Approval(msg.sender, _spender, _value); // 觸發授權事件
        return true;
    }

    // 授權轉帳函數
    // 從授權者賬戶中轉移代幣到目標賬戶。
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from], "Insufficient balance."); // 確保授權者有足夠的餘額。
        require(_value <= allowance[_from][msg.sender], "Allowance exceeded."); // 確保調用者有足夠的授權。
        balanceOf[_from] -= _value; // 從授權者的余額中減去轉移的數量。
        balanceOf[_to] += _value; // 將轉移的數量添加到目標賬戶的餘額中。
        allowance[_from][msg.sender] -= _value; // 減少調用者的授權數量
        emit Transfer(_from, _to, _value); // 觸法轉帳事件
        return true;
    }
}
