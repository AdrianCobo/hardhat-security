// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

//El problema aqui es que al ser inicializable, no se garantiza que ya esté inicializado. La persona que inicialize el contrato se convertira en el
//dueño de el pudiendo atacar los fondos

contract MetamorphicContract is Initializable {
    address payable owner;

    function kill() external {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}
